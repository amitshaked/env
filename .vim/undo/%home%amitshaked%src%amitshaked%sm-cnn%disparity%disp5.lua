Vim�UnDo� �����)�?��@|X"�������z�u�(�H   =   -   local criterion = nn.MSECriterion():cuda()            A       A   A   A    W��|    _�                             ����                                                                                                                                                                                                                                                                                                                                                             W�t     �               �   5local Disp5, parent = torch.class('Disp5', 'DispNet')       $function Disp5:__init(self, dataset)   ,   local gtw = torch.Tensor({1,4,10,10,4,1})   2   local mll = nn.MulClassNLLCriterion(gtw):cuda()       W   local criterion = nn.ParallelCriterion():add(mll, 0.9):add(nn.BCECriterion():cuda())   8   --local criterion = nn.CrossEntropyCriterion():cuda()      self.name = 'disp3'   2   parent.__init(parent, self, dataset, criterion)   end           6function Disp5:feval(x, dl_dx, inputs, targets, x_new)      if x ~= x_new then         x:copy(x_new)      end   G   -- reset gradients (gradients are always accumulated, to accommodate      -- batch methods)      dl_dx:zero()       Y   -- evaluate the loss function and its derivative with respect to x, given a mini batch   1   local prediction = self.net_tr:forward(inputs)       :   local probs, conf = prediction[1]:cuda(), prediction[2]   &   local _, pred = torch.max(probs, 2)          pred = pred:cuda()       0   local tr = torch.add(pred, -1, targets):abs()   +   local true_conf = torch.le(tr, 1):cuda()   /   --print(true_conf:sum() / true_conf:size(1))       m   local loss_x = self.criterion:forward({probs:clone(), conf:clone()}, {targets:clone(), true_conf:clone()})       L   local back = self.criterion:backward({probs, conf}, {targets, true_conf})       %   self.net_tr:backward(inputs, back)          return loss_x, dl_dx       end   function Disp5:build_train()   !   local disp_max = self.disp_max      local disp = nn.Sequential()   U   disp:add(Convolution(disp_max + 2, disp_max  +2 , self.params.ks, self.params.ks))      disp:add(Activation())       T   disp:add(Convolution(disp_max  +2, disp_max * 2, self.params.ks, self.params.ks))      disp:add(Activation())       T   disp:add(Convolution(disp_max * 2, disp_max * 2, self.params.ks, self.params.ks))      disp:add(Activation())       6   disp:add(Convolution(disp_max * 2, disp_max, 3, 3))      disp:add(Activation())       2   disp:add(Convolution(disp_max, disp_max, 1, 1))      disp:add(Activation())   2   disp:add(Convolution(disp_max, disp_max, 1, 1))      disp:add(Activation())   2   disp:add(Convolution(disp_max, disp_max, 1, 1))          disp:add(nn.Squeeze())          disp:add(         nn.ConcatTable()   (         :add(cudnn.SpatialLogSoftMax())            :add(nn.Sequential()   /            :add(nn.Linear(disp_max, disp_max))               :add(Activation())   (            :add(nn.Linear(disp_max, 1))               :add(nn.Sigmoid())   
         )         )          self.net_tr = disp:cuda()      init(self.net_tr)   end           function Disp5:build_test()   5   self.net_te = self.net_tr:clone('weight', 'bias')    E   self.net_te:remove(self.net_te:size()) -- replace linear with conv      self.net_te:add(         nn.ConcatTable()   (         :add(cudnn.SpatialLogSoftMax())            :add(nn.Sequential()   I            :add(nn.SpatialConvolution1_fw(self.disp_max, self.disp_max))               :add(Activation())   =            :add(nn.SpatialConvolution1_fw(self.disp_max, 1))               :add(nn.Sigmoid())   
         )         )   &   self:build_test_module(self.net_te)      self.net_te:evaluate()      self.net_te:cuda()   end       %function Disp5:forward(vols, x_batch)   (   vols = nn.Tanh():cuda():forward(vols)      vols:mul(-1):add(1)      --vols = torch.exp(-vols)   	--   	local dmax = vols:size(2)   S	local input = torch.CudaTensor(vols:size(1), dmax + 2, vols:size(3), vols:size(4))       %	input[{{},{1, dmax}, {}, {}}] = vols   7	input[{{1},{dmax+1, dmax+1}, {}, {}}] = x_batch[{{1}}]   7	input[{{1},{dmax+2, dmax+2}, {}, {}}] = x_batch[{{2}}]   7	input[{{2},{dmax+1, dmax+1}, {}, {}}] = x_batch[{{1}}]   7	input[{{2},{dmax+2, dmax+2}, {}, {}}] = x_batch[{{2}}]   4   local out = self:forward_free(self.net_te, input)      local vols = out[1]:cuda()      local conf = out[2]      --vols:mul(-1)--:add(1)      return vols, conf   end       >function Disp5:get_disparity_training_samples(start, size, ws)   N   --x, y, _, _ = self.dataset:get_disparity_training_samples(start, size, ws)       D   local x = torch.FloatTensor(size, self.disp_max+2, ws, ws):zero()   &   local y = torch.FloatTensor(size,1)   &   --local y = torch.FloatTensor(size)       !   for i=start, start+ size -1 do   +      local idx = self.dataset.perm_disp[i]   -      local img = self.dataset.disp[{idx, 1}]   .      local dim3 = self.dataset.disp[{idx, 2}]   .      local dim4 = self.dataset.disp[{idx, 3}]   +      local d = self.dataset.disp[{idx, 4}]             idx = i-start+1       ,      width = self.dataset.metadata[{img,2}]       :      local x2 = self.dataset.X2[self.dataset.X2_idx[img]]       !      local l = dim3 - ((ws-1)/2)   !      local r = dim3 + ((ws-1)/2)   !      local b = dim4 - ((ws-1)/2)   !      local u = dim4 + ((ws-1)/2)         local l1 = 1         local r1 = ws         local b1 = 1         local u1 = ws         if l < 1 then            l1 = 1 + (1-l)            l = 1   	      end         if r > x2:size(2) then   "         r1 = ws -(r - x2:size(2))            r = x2:size(2)   	      end         if b < 1 then            b1 = 1 + (1-b)            b = 1   	      end         if u > x2:size(3) then             u1 = ws -(u-x2:size(3))            u = x2:size(3)   	      end       -      local x0, x1 = self.dataset:get_lr(img)   M      x[{idx, {1, self.disp_max}, {l1, r1}, {b1,u1}}] = x2[{{},{l,r}, {b,u}}]   r		self.dataset:make_patch(x0, x[{idx, {self.disp_max +1, self.disp_max+1}, {l1, r1}, {b1,u1}}] ,dim3,dim4,ws, nil)   u		self.dataset:make_patch(x0, x[{idx, {self.disp_max +2, self.disp_max+2}, {l1, r1}, {b1,u1}}], dim3,dim4 -d,ws, nil)       %      --:pow(torch.uniform(0.8, 1.2))   1      y[idx] = d -- disp is [0, .. , disp_max -1]          end          return x:cuda(), y:cuda()   end   'function Disp5:set_best_params(dataset)   "   parent:set_best_params(dataset)   end5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             W�    �   .   0          'function Disp2:set_best_params(dataset)�   &   (          function Disp2:build_test()�   
             function Disp2:build_train()�                $function Disp2:__init(self, dataset)�                 5local Disp2, parent = torch.class('Disp2', 'DispNet')5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             W��     �         1    �         1    5�_�                       8    ����                                                                                                                                                                                                                                                                                                                                                             W��     �         2      8   local criterion = nn.MulClassNLLCriterion(gtw):cuda()5�_�                       #    ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W��     �                %	local mse = nn.MSECriterion():cuda()   ,   local gtw = torch.Tensor({1,4,10,10,4,1})5�_�                           ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W��    �         0         self.name = 'disp2'5�_�                           ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W��     �          0    �         0    5�_�      	                 *    ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W��     �          1      2   disp:add(Convolution(disp_max, disp_max, 1, 1))5�_�      
           	   "       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W��    �   !   "          &   disp:add(cudnn.SpatialLogSoftMax())5�_�   	              
   (       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W��    �   '   (          >   self.net_te:remove(self.net_te:size()) -- remove LogSoftMax5�_�   
                    &    ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W��Z    �         /      &   local criterion = nn.MSECriterion()5�_�                           ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���    �          /    �         /    5�_�                           ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �         0    �         0    5�_�                           ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �         1      -   local criterion = nn.MSECriterion():cuda()5�_�                           ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���    �         1      -   local criterion = nn.MSECriterion():cuda()5�_�                           ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���    �         1      -   local criterion = nn.ABSCriterion():cuda()5�_�                    "        ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W��;     �   "   $   2      	�   "   $   1    5�_�                    #   
    ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W��@     �   "   $   2      	disp:add()5�_�                    #       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W��K   	 �   "   $   2      	disp:add(nn.HardTanh())5�_�                    #       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W��Y    �   "   $   2      #	disp:add(nn.HardTanh(0, disp_max))5�_�                    (        ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   (   2   2    �   (   )   2    5�_�                    1        ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   1   3   ;    5�_�                    +   	    ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   *   ,   <      *   local _, d1 = torch.max(vols[{{1}}], 2)5�_�                    +   	    ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   *   ,   <      )   local , d1 = torch.max(vols[{{1}}], 2)5�_�                    +   	    ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   *   ,   <      (   local  d1 = torch.max(vols[{{1}}], 2)5�_�                    +       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   *   ,   <      '   local d1 = torch.max(vols[{{1}}], 2)5�_�                    +       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   *   ,   <      &   local d1 = orch.max(vols[{{1}}], 2)5�_�                    +       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   *   ,   <      %   local d1 = rch.max(vols[{{1}}], 2)5�_�                    +       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   *   ,   <      $   local d1 = ch.max(vols[{{1}}], 2)5�_�                    +       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   *   ,   <      #   local d1 = h.max(vols[{{1}}], 2)5�_�                     +       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   *   ,   <      "   local d1 = .max(vols[{{1}}], 2)5�_�      !               +       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   *   ,   <      !   local d1 = max(vols[{{1}}], 2)5�_�       "           !   +       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   *   ,   <          local d1 = ax(vols[{{1}}], 2)5�_�   !   #           "   +       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   *   ,   <         local d1 = x(vols[{{1}}], 2)5�_�   "   $           #   +       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   *   ,   <         local d1 = (vols[{{1}}], 2)5�_�   #   %           $   +       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   *   ,   <         local d1 = vols[{{1}}], 2)5�_�   $   &           %   +       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   *   ,   <         local d1 = vols[{{1}}] 2)5�_�   %   '           &   +       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   *   ,   <         local d1 = vols[{{1}}]2)5�_�   &   (           '   +       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   *   ,   <         local d1 = vols[{{1}}])5�_�   '   )           (   ,   	    ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   +   -   <      *   local _, d2 = torch.max(vols[{{2}}], 2)5�_�   (   *           )   ,   	    ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   +   -   <      )   local , d2 = torch.max(vols[{{2}}], 2)5�_�   )   +           *   ,   	    ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   +   -   <      (   local  d2 = torch.max(vols[{{2}}], 2)5�_�   *   ,           +   ,       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   +   -   <      '   local d2 = torch.max(vols[{{2}}], 2)5�_�   +   -           ,   ,       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   +   -   <      &   local d2 = orch.max(vols[{{2}}], 2)5�_�   ,   .           -   ,       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   +   -   <      %   local d2 = rch.max(vols[{{2}}], 2)5�_�   -   /           .   ,       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   +   -   <      $   local d2 = ch.max(vols[{{2}}], 2)5�_�   .   0           /   ,       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   +   -   <      #   local d2 = h.max(vols[{{2}}], 2)5�_�   /   1           0   ,       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   +   -   <      "   local d2 = .max(vols[{{2}}], 2)5�_�   0   2           1   ,       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   +   -   <      !   local d2 = max(vols[{{2}}], 2)5�_�   1   3           2   ,       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   +   -   <          local d2 = ax(vols[{{2}}], 2)5�_�   2   4           3   ,       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   +   -   <         local d2 = x(vols[{{2}}], 2)5�_�   3   5           4   ,       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   +   -   <         local d2 = (vols[{{2}}], 2)5�_�   4   6           5   ,       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   +   -   <         local d2 = vols[{{2}}], 2)5�_�   5   7           6   ,       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   +   -   <         local d2 = vols[{{2}}] 2)5�_�   6   8           7   ,       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���     �   +   -   <         local d2 = vols[{{2}}]2)5�_�   7   :           8   ,       ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���    �   +   -   <         local d2 = vols[{{2}}])5�_�   8   ;   9       :   4        ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W��Q     �   4   6   <    �   4   5   <    5�_�   :   <           ;   5   E    ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W��T    �   4   6   =      E   self.net_te:remove(self.net_te:size()) -- replace linear with conv5�_�   ;   =           <          ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W��d     �         =      /   --local criterion = nn.MSECriterion():cuda()5�_�   <   >           =          ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W��d     �         =      .   -local criterion = nn.MSECriterion():cuda()5�_�   =   ?           >          ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W��e    �         =      -   local criterion = nn.AbsCriterion():cuda()5�_�   >   @           ?          ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W��y     �         =      /   --local criterion = nn.AbsCriterion():cuda()5�_�   ?   A           @          ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W��y     �         =      .   -local criterion = nn.AbsCriterion():cuda()5�_�   @               A          ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W��{    �         =      -   local criterion = nn.MSECriterion():cuda()5�_�   8           :   9          ����                                                                                                                                                                                                                                                                                                                               %          #       V   %    W���    �         <      -   local criterion = nn.MSECriterion():cuda()5��