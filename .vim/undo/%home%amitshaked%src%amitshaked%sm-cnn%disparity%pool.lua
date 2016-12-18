Vim�UnDo� �h���NV>-Ôa�[w~ ȵ�"����{��   �   Z      x[{idx, {}, {l1, r1}, {b1,u1}}] = x2[{{},{l,r}, {b,u}}]:pow(torch.uniform(0.8, 1.2))   l   =                       W�z"    _�                             ����                                                                                                                                                                                                                                                                                                                                                             W�f�    �   u   w          2function DisparityNetwork:set_best_params(dataset)�   n   p          -function DisparityNetwork:learningRate(epoch)�   9   ;          Ifunction DisparityNetwork:get_disparity_training_samples(start, size, ws)�   -   /          3function DisparityNetwork:get_disparity_image(vols)�   $   &          'function DisparityNetwork:forward(vols)�      !          &function DisparityNetwork:build_test()�                'function DisparityNetwork:build_train()�                /function DisparityNetwork:__init(self, dataset)�                 Klocal DisparityNetwork, parent = torch.class('DisparityNetwork', 'Network')5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             W�g-     �         �         �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             W�g4     �         �         disp:add()5�_�                       $    ����                                                                                                                                                                                                                                                                                                                                                             W�g�     �         �      	disp:add(Activation())    �         �         �         �    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             W�g�     �         �      %   disp:add(nn.SpatialAvaragePooling)5�_�                       $    ����                                                                                                                                                                                                                                                                                                                                                             W�g�     �         �      %   disp:add(nn.SpatialAveragePooling)5�_�                       %    ����                                                                                                                                                                                                                                                                                                                                                             W�g�     �         �      '   disp:add(nn.SpatialAveragePooling())5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                             W�qb     �         �         �         �    5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                             W�qf     �         �         disp:add()5�_�   	              
      (    ����                                                                                                                                                                                                                                                                                                                                                             W�qr     �         �      *   disp:add(nn.SpatialReflectionPadding())5�_�   
                    0    ����                                                                                                                                                                                                                                                                                                                                                             W�qu     �         �      2   disp:add(nn.SpatialAveragePooling(2,2,2,2,0,0))5�_�                       (    ����                                                                                                                                                                                                                                                                                                                                                             W�qw     �         �      .   disp:add(nn.SpatialAveragePooling(2,2,2,2))5�_�                       &    ����                                                                                                                                                                                                                                                                                                                                                             W�qx     �         �      .   disp:add(nn.SpatialAveragePooling(2,3,2,2))5�_�                       ,    ����                                                                                                                                                                                                                                                                                                                                                             W�qz     �         �      .   disp:add(nn.SpatialAveragePooling(3,3,2,2))5�_�                            ����                                                                                                                                                                                                                                                                                                                               +          +       V   +    W�q�     �         �    �         �    5�_�                           ����                                                                                                                                                                                                                                                                                                                               +          +       V   +    W�q�     �         �         �         �    5�_�                           ����                                                                                                                                                                                                                                                                                                                               +          +       V   +    W�q�     �         �      0	disp:add(Convolution(disp_max, disp_max, 1, 1))5�_�                           ����                                                                                                                                                                                                                                                                                                                               +          +       V   +    W�q�     �          �      	disp:add(Activation())5�_�                           ����                                                                                                                                                                                                                                                                                                                               +          +       V   +    W�q�     �         �      J	disp:add(Convolution(disp_max, disp_max, self.params.ks, self.params.ks))5�_�                           ����                                                                                                                                                                                                                                                                                                                               +          +       V   +    W�q�     �         �      	disp:add(Activation())5�_�                           ����                                                                                                                                                                                                                                                                                                                               +          +       V   +    W�q�     �         �      J	disp:add(Convolution(disp_max, disp_max, self.params.ks, self.params.ks))5�_�                           ����                                                                                                                                                                                                                                                                                                                               +          +       V   +    W�q�    �         �      	disp:add(Activation())5�_�                           ����                                                                                                                                                                                                                                                                                                                               +          +       V   +    W�q�     �         �      L	--disp:add(Convolution(disp_max, disp_max, self.params.ks, self.params.ks))5�_�                           ����                                                                                                                                                                                                                                                                                                                               +          +       V   +    W�q�     �         �      K	-disp:add(Convolution(disp_max, disp_max, self.params.ks, self.params.ks))5�_�                            ����                                                                                                                                                                                                                                                                                                                               +          +       V   +    W�q�    �      !   �      0	disp:add(Convolution(disp_max, disp_max, 1, 1))5�_�                     l   =    ����                                                                                                                                                                                                                                                                                                                               +          +       V   +    W�z!    �   k   m   �      Z      x[{idx, {}, {l1, r1}, {b1,u1}}] = x2[{{},{l,r}, {b,u}}]:pow(torch.uniform(0.8, 1.2))5��