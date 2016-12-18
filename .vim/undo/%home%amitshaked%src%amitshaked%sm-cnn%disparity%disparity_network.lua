Vim�UnDo� �6��k~޴^g������H����D�����^�   e                  .       .   .   .    Wֽ�    _�                             ����                                                                                                                                                                                                                                                                                                                                                             Wֹ�    �   |   ~          2function DisparityNetwork:set_best_params(dataset)�   u   w          -function DisparityNetwork:learningRate(epoch)�   >   @          Ifunction DisparityNetwork:get_disparity_training_samples(start, size, ws)�   2   4          3function DisparityNetwork:get_disparity_image(vols)�   *   ,          'function DisparityNetwork:forward(vols)�   $   &          &function DisparityNetwork:build_test()�                'function DisparityNetwork:build_train()�                /function DisparityNetwork:__init(self, dataset)�                Klocal DisparityNetwork, parent = torch.class('DisparityNetwork', 'Network')5�_�                       %    ����                                                                                                                                                                                                                                                                                                                                                             Wֹ�    �         �      &function DispNet:__init(self, dataset)5�_�                            ����                                                                                                                                                                                                                                                                                                                               )          /       V   /    Wֹ�     �                *   local gtw = torch.Tensor({2,4,8,8,4,2})   8   local criterion = nn.MulClassNLLCriterion(gtw):cuda()   4   --local criterion = nn.ClassNLLCriterion():cuda()5�_�                           ����                                                                                                                                                                                                                                                                                                                               )          /       V   /    Wֹ�    �         �         local name = 'disp'5�_�                            ����                                                                                                                                                                                                                                                                                                                                      &          V       Wֺ     �                function DispNet:build_train()   !   local disp_max = self.disp_max      local disp = nn.Sequential()   L   disp:add(Convolution(disp_max, disp_max, self.params.ks, self.params.ks))      disp:add(Activation())   L   disp:add(Convolution(disp_max, disp_max, self.params.ks, self.params.ks))      disp:add(Activation())   L   disp:add(Convolution(disp_max, disp_max, self.params.ks, self.params.ks))      disp:add(Activation())   L   disp:add(Convolution(disp_max, disp_max, self.params.ks, self.params.ks))      disp:add(Activation())   2   disp:add(Convolution(disp_max, disp_max, 1, 1))      disp:add(Activation())   2   disp:add(Convolution(disp_max, disp_max, 1, 1))          disp:add(nn.Squeeze())   &   disp:add(cudnn.SpatialLogSoftMax())      self.net_tr = disp:cuda()      init(self.net_tr)   end       function DispNet:build_test()   4   self.net_te = self.net_tr:clone('weight', 'bias')   <	self.net_te:remove(self.net_te:size()) -- remove LogSoftMax   &   self:build_test_module(self.net_te)   end5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       Wֺ    �                 5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       WֺG     �         h         return vols5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                V       WֺI    �         h         return vols:cuda5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                V       WֺN    �                   --vols:mul(-1)--:add(1)5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                V       WֺS     �                -   --local  _, d1 = torch.min(vols[{{1}}], 2)   -   --local  _, d2 = torch.min(vols[{{2}}], 2)5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                V       WֺZ     �         e         disp[1] = d2:cuda()--:add(1)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Wֺ[     �         e         disp[2] = d1:cuda()--:add(1)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Wֺ]     �         e         disp[1] = d2:cuda():add(1)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Wֺ_     �         e         disp[1] = d2:cuda():add(-11)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Wֺa     �         e         disp[1] = d2:cuda():add(11)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Wֺb     �         e         disp[1] = d2:cuda():add(-11)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Wֺe     �         e         disp[2] = d1:cuda():add(1)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Wֺf    �         e         disp[2] = d1:cuda():add(1)5�_�                    M       ����                                                                                                                                                                                                                                                                                                                                                V       Wֺ�    �   L   N   e            y[idx] = d5�_�                    M       ����                                                                                                                                                                                                                                                                                                                                                V       Wֺ�     �   L   N   e            y[idx] = d+15�_�                    M       ����                                                                                                                                                                                                                                                                                                                                                V       Wֺ�   	 �   L   N   e             y[idx] = d+1 -- disp is []5�_�                           ����                                                                                                                                                                                                                                                                                                                            M   2       M                 Wֻ     �         e         disp[1] = d2:cuda():add(-1)      disp[2] = d1:cuda():add(-1)�         e    5�_�                           ����                                                                                                                                                                                                                                                                                                                            M   2       M                 Wֻ   
 �         e         disp[2] = d1:cuda():add(-1)      return disp�         e    5�_�                           ����                                                                                                                                                                                                                                                                                                                            M   2       M                 Wֻ�    �         e         local name = 'dispnet'5�_�                           ����                                                                                                                                                                                                                                                                                                                            M   2       M                 Wֻ�    �                   local name = name5�_�                            ����                                                                                                                                                                                                                                                                                                                            L   2       L                 WּF     �      D   d    �         d    5�_�                           ����                                                                                                                                                                                                                                                                                                                            s   2       s                 Wּ�    �         �      6function Disp3:feval(x, dl_dx, inputs, targets, x_new)5�_�                    (       ����                                                                                                                                                                                                                                                                                                                            s   2       s                 Wּ�     �   '   (          8	local probs, conf = prediction[1]:cuda(), prediction[2]5�_�                    (       ����                                                                                                                                                                                                                                                                                                                            r   2       r                 Wּ�     �   '   (          $	local _, pred = torch.max(probs, 2)5�_�                    (        ����                                                                                                                                                                                                                                                                                                                            q   2       q                 Wּ�     �   '   (           5�_�                     (       ����                                                                                                                                                                                                                                                                                                                            p   2       p                 Wּ�     �   '   (          	pred = pred:cuda()5�_�      !               (        ����                                                                                                                                                                                                                                                                                                                            o   2       o                 Wּ�     �   '   (           5�_�       "           !   (       ����                                                                                                                                                                                                                                                                                                                            n   2       n                 Wּ�     �   '   (          .	local tr = torch.add(pred, -1, targets):abs()5�_�   !   #           "   (       ����                                                                                                                                                                                                                                                                                                                            m   2       m                 Wּ�     �   '   (          )	local true_conf = torch.le(tr, 3):cuda()5�_�   "   $           #   (        ����                                                                                                                                                                                                                                                                                                                            (          )          V       Wּ�     �   '   (          	--local a = true_conf:clone()   	--print(a:sum() / a:size(1))5�_�   #   %           $   (        ����                                                                                                                                                                                                                                                                                                                            (          (          V       Wּ�     �   '   (           5�_�   $   &           %   (   '    ����                                                                                                                                                                                                                                                                                                                            (          (          V       Wּ�     �   '   )   �      k	local loss_x = self.criterion:forward({probs:clone(), conf:clone()}, {targets:clone(), true_conf:clone()})5�_�   %   '           &   (   3    ����                                                                                                                                                                                                                                                                                                                            (          (          V       Wּ�     �   '   )   �      X	local loss_x = self.criterion:forward(prediction, {targets:clone(), true_conf:clone()})5�_�   &   (           '   (   1    ����                                                                                                                                                                                                                                                                                                                            (          (          V       Wּ�     �   '   )   �      W	local loss_x = self.criterion:forward(prediction, targets:clone(), true_conf:clone()})5�_�   '   )           (   (   J    ����                                                                                                                                                                                                                                                                                                                            (          (          V       Wּ�     �   '   )   �      _	local loss_x = self.criterion:forward(prediction:clone(), targets:clone(), true_conf:clone()})5�_�   (   *           )   (   J    ����                                                                                                                                                                                                                                                                                                                            (          (          V       Wּ�     �   '   )   �      L	local loss_x = self.criterion:forward(prediction:clone(), targets:clone()})5�_�   )   +           *   *   &    ����                                                                                                                                                                                                                                                                                                                            (          (          V       Wּ�     �   )   +   �      J	local back = self.criterion:backward({probs, conf}, {targets, true_conf})5�_�   *   ,           +   *   9    ����                                                                                                                                                                                                                                                                                                                            (          (          V       Wּ�     �   )   +   �      F	local back = self.criterion:backward(prediction, targets, true_conf})5�_�   +   -           ,   ,        ����                                                                                                                                                                                                                                                                                                                            ,   ,       4          V   ;    Wּ�    �   +   ,       	   -	--local grads = torch.le(conf, 0.005):cuda()   %	--print(grads:sum() / grads:size(1))   "	--grads = grads:expandAs(back[1])   6	--local ones = torch.CudaTensor(grads:size()):fill(1)       Z	--p_g = torch.add(torch.cmul(back[1]:clone(), grads:clone()), torch.add(ones, -1, grads))   	--p_g = back[2]:clone()   $	--local aa = torch.eq(p_g, 0):sum()   	--print('pg', p_g:sum())5�_�   ,   .           -   0        ����                                                                                                                                                                                                                                                                                                                            0           0           V        Wֽ�     �   0   1   y      end�   .   0   x    5�_�   -               .           ����                                                                                                                                                                                                                                                                                                                            /                      V        Wֽ�    �                8function DispNet:feval(x, dl_dx, inputs, targets, x_new)   	if x ~= x_new then   		x:copy(x_new)   	end   E	-- reset gradients (gradients are always accumulated, to accommodate   	-- batch methods)   	dl_dx:zero()       W	-- evaluate the loss function and its derivative with respect to x, given a mini batch   /	local prediction = self.net_tr:forward(inputs)       K	local loss_x = self.criterion:forward(prediction:clone(), targets:clone())       :	local back = self.criterion:backward(prediction, targets)       #	self.net_tr:backward(inputs, back)       	return loss_x, dl_dx   end5��