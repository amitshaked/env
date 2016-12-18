Vim�UnDo� YtK䁺)o��Q9%B��K��Yu��>�m�   �   'function McCnnSlow:getDecisionNetwork()            9       9   9   9    XU�    _�                             ����                                                                                                                                                                                                                                                                                                                                                             XU}     �         �    �      	   �    5�_�                    
       ����                                                                                                                                                                                                                                                                                                                                                             XU}    �   	      �      '   return FastNetwork:new(opt, dataset)5�_�                    �        ����                                                                                                                                                                                                                                                                                                                                                             XU}
    �   �               �   �            5�_�                       6    ����                                                                                                                                                                                                                                                                                                                                                             XU}    �         �      7function SlowNetwork:__init(self, name, sim, criterion)5�_�                       3    ����                                                                                                                                                                                                                                                                                                                                                             XU}'    �         �      4   parent.__init(parent, self, name, sim, criterion)5�_�                       !    ����                                                                                                                                                                                                                                                                                                                                                             XU}=     �         �    �         �    5�_�                       	    ����                                                                                                                                                                                                                                                                                                                                                             XU}c     �          �      'include('../modules/Concatenation.lua')5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                             XU}f    �         �      0include('../modules/SpatialConvolution1_fw.lua')5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                             XU}u    �         �    �         �    5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                             XU}w    �         �    5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                             XU}�     �      
   �         �      
   �    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             XU}�     �         �    �         �    5�_�                       	    ����                                                                                                                                                                                                                                                                                                                                                             XU}�    �         �      include('criterions/BCE.lua')5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             XU}�     �         �      .include('../../criterions/criterions/BCE.lua')5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             XU}�     �         �      -include('../../riterions/criterions/BCE.lua')5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             XU}�     �         �      ,include('../../iterions/criterions/BCE.lua')5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             XU}�     �         �      +include('../../terions/criterions/BCE.lua')5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             XU}�     �         �      *include('../../erions/criterions/BCE.lua')5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             XU}�     �         �      )include('../../rions/criterions/BCE.lua')5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             XU}�     �         �      (include('../../ions/criterions/BCE.lua')5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             XU}�     �         �      'include('../../ons/criterions/BCE.lua')5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             XU}�     �         �      &include('../../ns/criterions/BCE.lua')5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             XU}�     �         �      %include('../../s/criterions/BCE.lua')5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             XU}�   	 �         �      $include('../..//criterions/BCE.lua')5�_�                    
   &    ����                                                                                                                                                                                                                                                                                                                                                             XU}�   
 �   	      �      &   self.criterion = nn.BCECriterion2()5�_�                            ����                                                                                                                                                                                                                                                                                                                                       0           V        XU��     �                )function SlowNetwork:getDecisionNetwork()   #   local decision = nn.Sequential()   >   decision:add(nn.Reshape(self.params.bs, self.params.fm *2))   )   --decision:add(Activation(self.alpha))      for i = 1,self.params.l2 do   `      decision:add(nn.Linear(i == 1 and 2 * self.params.fm or self.params.nh2, self.params.nh2))   *      decision:add(Activation(self.alpha))      end       .   decision:add(nn.Linear(self.params.nh2, 1))   %   decision:add(cudnn.Sigmoid(false))      return decision   end       7function SlowNetwork:getTestDecisionNetwork(block, fin)       $   local b = block or self.params.l2   "   fin = fin or self.n_input_plane   #   local decision = nn.Sequential()   #   decision:add(nn.Concatenation())   )   --decision:add(Activation(self.alpha))      for i = 1,b do   p      decision:add(nn.SpatialConvolution1_fw(i == 1 and 2 * self.params.fm or self.params.nh2, self.params.nh2))   *      decision:add(Activation(self.alpha))      end       >   decision:add(nn.SpatialConvolution1_fw(self.params.nh2, 1))   $   decision:add(cudnn.Sigmoid(true))      return decision   end    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        XU��     �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        XU��     �                (local function createModel(opt, dataset)   '   return SlowNetwork:new(opt, dataset)   end5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        XU��     �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        XU��     �                ,function SlowNetwork:getDescriptionNetwork()   &   local description = nn.Sequential()          for i = 1,self.params.l1 do   R      description:add(Convolution(i == 1 and self.n_input_plane or self.params.fm,   6      self.params.fm, self.params.ks, self.params.ks))   %      if opt.normalize or opt.BN then   7         description:add(Normalization(self.params.fm))   	      end          if i < self.params.l1 then   U         description:add(Activation()) -- TODO: why adding activation here is a bug?    	      end      end      return description   end5�_�                             ����                                                                                                                                                                                                                                                                                                                                                  V        XU�)     �                 5�_�      !                       ����                                                                                                                                                                                                                                                                                                                                                  V        XU��     �         v         �         u    5�_�       "           !      &    ����                                                                                                                                                                                                                                                                                                                                                  V        XU��     �         v      '   testDecision = self:getTestNetowrk()5�_�   !   #           "      3    ����                                                                                                                                                                                                                                                                                                                                                  V        XU��     �         v    5�_�   "   $           #   %   5    ����                                                                                                                                                                                                                                                                                                                                       ,           V        XU��    �   $   &   w      C         local score = self:forward_free(self.net_te2, x_batch_te2)5�_�   #   %           $   (       ����                                                                                                                                                                                                                                                                                                                                       ,           V        XU�     �   '   )   w      >      self:fix_border(self.net_te, vols[{{index}}], direction)5�_�   $   &           %   (       ����                                                                                                                                                                                                                                                                                                                                       ,           V        XU�     �   '   )   w      =      self:fix_border(elf.net_te, vols[{{index}}], direction)5�_�   %   '           &   (       ����                                                                                                                                                                                                                                                                                                                                       ,           V        XU�     �   '   )   w      <      self:fix_border(lf.net_te, vols[{{index}}], direction)5�_�   &   (           '   (       ����                                                                                                                                                                                                                                                                                                                                       ,           V        XU�     �   '   )   w      ;      self:fix_border(f.net_te, vols[{{index}}], direction)5�_�   '   )           (   (       ����                                                                                                                                                                                                                                                                                                                                       ,           V        XU�     �   '   )   w      :      self:fix_border(.net_te, vols[{{index}}], direction)5�_�   (   *           )   (       ����                                                                                                                                                                                                                                                                                                                                       ,           V        XU�     �   '   )   w      9      self:fix_border(net_te, vols[{{index}}], direction)5�_�   )   +           *   (       ����                                                                                                                                                                                                                                                                                                                                       ,           V        XU�     �   '   )   w      8      self:fix_border(et_te, vols[{{index}}], direction)5�_�   *   ,           +   (       ����                                                                                                                                                                                                                                                                                                                                       ,           V        XU�     �   '   )   w      7      self:fix_border(t_te, vols[{{index}}], direction)5�_�   +   -           ,   (       ����                                                                                                                                                                                                                                                                                                                                       ,           V        XU�     �   '   )   w      6      self:fix_border(_te, vols[{{index}}], direction)5�_�   ,   .           -   (       ����                                                                                                                                                                                                                                                                                                                                       ,           V        XU�     �   '   )   w      5      self:fix_border(te, vols[{{index}}], direction)5�_�   -   /           .   (       ����                                                                                                                                                                                                                                                                                                                                       ,           V        XU�     �   '   )   w      4      self:fix_border(e, vols[{{index}}], direction)5�_�   .   0           /   (       ����                                                                                                                                                                                                                                                                                                                                       ,           V        XU�     �   '   )   w      3      self:fix_border(, vols[{{index}}], direction)5�_�   /   1           0   (       ����                                                                                                                                                                                                                                                                                                                                       ,           V        XU�    �   '   )   w      2      self:fix_border( vols[{{index}}], direction)5�_�   0   2           1   *       ����                                                                                                                                                                                                                                                                                                                                       ,           V        XU�     �   )   *             self.net_te2:clearState()5�_�   1   3           2          ����                                                                                                                                                                                                                                                                                                                                       +           V        XU�    �         v      4   testDecision = self:getTestNetowrk(self.decision)5�_�   2   4           3          ����                                                                                                                                                                                                                                                                                                                                       +           V        XU��    �         v      0   desc_l, desc_r = self:getDescriptors(x_batch)5�_�   3   5           4           ����                                                                                                                                                                                                                                                                                                                                       +           V        XU�T     �         v    �         v    5�_�   4   6           5           ����                                                                                                                                                                                                                                                                                                                                       7           V        XU�W    �         �    5�_�   5   7           6   �        ����                                                                                                                                                                                                                                                                                                                                        8           V        XU�i     �   �   �          return createModel5�_�   6   8           7   �        ����                                                                                                                                                                                                                                                                                                                                        8           V        XU�i    �   �   �           5�_�   7   9           8          ����                                                                                                                                                                                                                                                                                                                                        8           V        XU�     �         �      'function McCnnSlow:getDecisionNetwork()5�_�   8               9          ����                                                                                                                                                                                                                                                                                                                                        8           V        XU�    �         �      "function Slow:getDecisionNetwork()5��