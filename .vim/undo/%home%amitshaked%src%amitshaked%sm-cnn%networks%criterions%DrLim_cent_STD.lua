Vim�UnDo� :�Aq��[W�.m�&8Оu�'DI�*�խ�   ?   (   self.gradInput:resizeAs(input):zero()   3   (      F   8   F   F   .    V�[�    _�                     0       ����                                                                                                                                                                                                                                                                                                                                                             V�U�     �   /   1   =         deriv_std(m, gradM)5�_�                    1       ����                                                                                                                                                                                                                                                                                                                                                             V�U�     �   0   2   =         deriv_std(nm, gradNm)5�_�                    3       ����                                                                                                                                                                                                                                                                                                                                                             V�U�     �   2   4   =      $   self.gradInput:mul(1-self.lambda)5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             V�U�     �      "   =      F   self.output = self.tmp:mean() + (1- self.lambda) * (m_std + nm_std)5�_�                    !       ����                                                                                                                                                                                                                                                                                                                                                             V�U�     �       "   >      7	self.output:add()+ (1- self.lambda) * (m_std + nm_std)5�_�                    !       ����                                                                                                                                                                                                                                                                                                                                                             V�U�     �       "   >      4	self.output:add((1- self.lambda) * (m_std + nm_std)5�_�                    $        ����                                                                                                                                                                                                                                                                                                                                                             V�U�     �   "   $   ?      end    �   #   %   ?       �   #   %   >    5�_�      	              !       ����                                                                                                                                                                                                                                                                                                                                                             V�U�     �       "   >      4	self.output:add((1- self.lambda) * (m_std + nm_std)5�_�      
           	   !   4    ����                                                                                                                                                                                                                                                                                                                                                             V�U�    �       "   >      4	self.output:add((1- self.lambda) * (m_std + nm_std)5�_�   	              
   !       ����                                                                                                                                                                                                                                                                                                                                                             V�U�    �       "   >      5	self.output:add((1- self.lambda) * (m_std + nm_std))5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                             V�W�     �                 5�_�                       )    ����                                                                                                                                                                                                                                                                                                                                                             V�Y�     �         >      	�         =    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             V�Y�     �         >      	5�_�                    -   !    ����                                                                                                                                                                                                                                                                                                                                                             V�Z&     �   ,   /   >      -   self.gradInput:resizeAs(input):copy(input)5�_�                    .       ����                                                                                                                                                                                                                                                                                                                                                             V�Z/     �   -   /   ?      	self:gradInput:copy(input)5�_�                    -   !    ����                                                                                                                                                                                                                                                                                                                                                             V�Z4    �   ,   .   ?      !   self.gradInput:resizeAs(input)5�_�                   :       ����                                                                                                                                                                                                                                                                                                                                                             V�Zr     �   9   ;   ?      '   ---- Add grad for non matching pairs5�_�                    :       ����                                                                                                                                                                                                                                                                                                                                                             V�Zr     �   9   ;   ?      &   --- Add grad for non matching pairs5�_�                    -        ����                                                                                                                                                                                                                                                                                                                                                             V�Zx     �   ,   .   ?      (   self.gradInput:resizeAs(input):zero()5�_�                    -        ����                                                                                                                                                                                                                                                                                                                                                             V�Zx     �   ,   .   ?      '  self.gradInput:resizeAs(input):zero()5�_�                    -        ����                                                                                                                                                                                                                                                                                                                                                             V�Zx     �   ,   .   ?      & self.gradInput:resizeAs(input):zero()5�_�                    -        ����                                                                                                                                                                                                                                                                                                                                                             V�Zx     �   ,   .   ?      %self.gradInput:resizeAs(input):zero()5�_�                    -        ����                                                                                                                                                                                                                                                                                                                                                             V�Z{    �   ,   .   ?      $elf.gradInput:resizeAs(input):zero()5�_�                    !       ����                                                                                                                                                                                                                                                                                                                                                             V�[9     �       "   ?      7	--self.output:add((1- self.lambda) * (m_std + nm_std))5�_�                    !       ����                                                                                                                                                                                                                                                                                                                                                             V�[9     �       "   ?      6	-self.output:add((1- self.lambda) * (m_std + nm_std))5�_�                    .       ����                                                                                                                                                                                                                                                                                                                                                             V�[N     �   -   /   ?      	--self:gradInput:copy(input)5�_�                    .       ����                                                                                                                                                                                                                                                                                                                                                             V�[N     �   -   /   ?      	-self:gradInput:copy(input)5�_�                     2       ����                                                                                                                                                                                                                                                                                                                                                             V�[X     �   1   3   ?         --deriv_std(m, gradM)5�_�      !               2       ����                                                                                                                                                                                                                                                                                                                                                             V�[X     �   1   3   ?         -deriv_std(m, gradM)5�_�       "           !   3       ����                                                                                                                                                                                                                                                                                                                                                             V�[Y     �   2   4   ?         --deriv_std(nm, gradNm)5�_�   !   #           "   3       ����                                                                                                                                                                                                                                                                                                                                                             V�[Y     �   2   4   ?         -deriv_std(nm, gradNm)5�_�   "   $           #   5       ����                                                                                                                                                                                                                                                                                                                                                             V�[\     �   4   6   ?      &   --self.gradInput:mul(1-self.lambda)5�_�   #   %           $   5       ����                                                                                                                                                                                                                                                                                                                                                             V�[\     �   4   6   ?      %   -self.gradInput:mul(1-self.lambda)5�_�   $   &           %   ;       ����                                                                                                                                                                                                                                                                                                                                                             V�[q     �   ;   =   ?    5�_�   %   '           &   7       ����                                                                                                                                                                                                                                                                                                                                                             V�[~     �   6   8   @      "   ----Add grad for matching pairs5�_�   &   (           '   7       ����                                                                                                                                                                                                                                                                                                                                                             V�[~     �   6   8   @      !   ---Add grad for matching pairs5�_�   '   )           (   7       ����                                                                                                                                                                                                                                                                                                                                                             V�[�    �   6   8   @          --Add grad for matching pairs5�_�   (   *           )   .       ����                                                                                                                                                                                                                                                                                                                                                             V�[�    �   -   /   @      	self:gradInput:copy(input)5�_�   )   ,           *   !       ����                                                                                                                                                                                                                                                                                                                                                             V�[�     �       "   @      5	self.output:add((1- self.lambda) * (m_std + nm_std))5�_�   *   -   +       ,            ����                                                                                                                                                                                                                                                                                                                                                             V�[�     �      !   @          self.output = self.tmp:mean()   E	self.output = self.output + add((1- self.lambda) * (m_std + nm_std))�      !   @          self.output = self.tmp:mean()5�_�   ,   .           -       #    ����                                                                                                                                                                                                                                                                                                                                                             V�[�     �      !   ?      K   self.output = self.tmp:mean() + add((1- self.lambda) * (m_std + nm_std))5�_�   -   8           .       F    ����                                                                                                                                                                                                                                                                                                                                                             V�[�    �      !   ?      G   self.output = self.tmp:mean() + (1- self.lambda) * (m_std + nm_std))5�_�   .   :   /       8          ����                                                                                                                                                                                                                                                                                                                                                  v        V�v1     �         ?      %	self.tmp:resizeAs(input):copy(input)5�_�   8   ;   9       :           ����                                                                                                                                                                                                                                                                                                                                                  v        V�x�     �         ?    �         ?      $	-- Add score for non matching pairs      nm:mul(-1):add(self.margin)      self.gt = torch.gt(nm, 0)      nm:cmul(self.gt)      nm:pow(2)      nm:mul(self.lambda)5�_�   :   <           ;   !       ����                                                                                                                                                                                                                                                                                                                                                  v        V�x�     �   !   "   E       5�_�   ;   =           <          ����                                                                                                                                                                                                                                                                                                                                                  v        V�x�     �         F      &	---- Add score for non matching pairs5�_�   <   >           =          ����                                                                                                                                                                                                                                                                                                                                                  v        V�x�     �         F      3   --nm:pow(2):mul(-1):add(self.margin*self.margin)5�_�   =   ?           >          ����                                                                                                                                                                                                                                                                                                                                                  v        V�x�     �         F         --self.gt = torch.gt(nm, 0)5�_�   >   @           ?          ����                                                                                                                                                                                                                                                                                                                                                  v        V�x�     �         F         --nm:cmul(self.gt)5�_�   ?   B           @          ����                                                                                                                                                                                                                                                                                                                                                  v        V�x�     �         F         --nm:mul(self.lambda)5�_�   @   C   A       B   B        ����                                                                                                                                                                                                                                                                                                                                                  v        V�x�     �   B   C   F    �   B   C   F      %   -- Add grad for non matching pairs   g   gradNm:add(torch.mul(torch.cmul(self.gt, torch.add(nm, -self.margin)), 2*self.lambda/input:size(1)))5�_�   B   D           C   A       ����                                                                                                                                                                                                                                                                                                                                                  v        V�x�     �   @   B   H      Q   --gradNm:add(torch.cmul(self.gt, torch.mul(nm, -2*self.lambda/input:size(1))))5�_�   C   F           D   @       ����                                                                                                                                                                                                                                                                                                                                                  v        V�x�    �   ?   A   H      '   ---- Add grad for non matching pairs5�_�   D       E       F   3   (    ����                                                                                                                                                                                                                                                                                                                                                  v        V�y]    �   2   4   H      !   self.gradInput:resizeAs(input)�   2   5   H      -   self.gradInput:resizeAs(input):copy(input)5�_�   D           F   E   D       ����                                                                                                                                                                                                                                                                                                                                                  v        V�x�    �   C   E   H      g   gRadNm:add(torch.mul(torch.cmul(self.gt, torch.add(nm, -self.margin)), 2*self.lambda/input:size(1)))5�_�   @           B   A   B        ����                                                                                                                                                                                                                                                                                                                                                  v        V�x�     �   A   C   F       �   @   C   F      P   gradNm:add(torch.cmul(self.gt, torch.mul(nm, -2*self.lambda/input:size(1))))u5�_�   8           :   9           ����                                                                                                                                                                                                                                                                                                                                                  v        V�v�     �          ?      pequire 'math'5�_�   .   0       8   /   ,        ����                                                                                                                                                                                                                                                                                                                            ,           3   #       V       V�r�     �   +   5        �   ,   -   6    �   +   ,   6      (   self.gradInput:resizeAs(input):zero()   4   local gradM, gradNm = slice_input(self.gradInput)         .   -- add grad for (1-lambda)*(std_m + std_nm)      gradM = deriv_std(m)      gradNm = deriv_std(nm)       $   self.gradInput:mul(1-self.lambda)5�_�   /   1           0   0       ����                                                                                                                                                                                                                                                                                                                            ,           3   #       V       V�s     �   /   1   >         gradM:copy()deriv_std(m)5�_�   0   2           1   0       ����                                                                                                                                                                                                                                                                                                                            ,           3   #       V       V�s     �   /   1   >         gradM:copy()deriv_std(m)5�_�   1   3           2   0       ����                                                                                                                                                                                                                                                                                                                            ,           3   #       V       V�s     �   /   1   >         gradM:copy(deriv_std(m)5�_�   2   4           3   0       ����                                                                                                                                                                                                                                                                                                                            ,           3   #       V       V�s     �   /   1   >         gradM:copy(deriv_std(m))5�_�   3   5           4   1       ����                                                                                                                                                                                                                                                                                                                            ,           3   #       V       V�s     �   0   2   >         gradNm = deriv_std(nm))5�_�   4   6           5   1       ����                                                                                                                                                                                                                                                                                                                            ,           3   #       V       V�s     �   0   2   >         gradNm = ()deriv_std(nm))5�_�   5   7           6   1       ����                                                                                                                                                                                                                                                                                                                            ,           3   #       V       V�s     �   0   2   >         gradNm = (deriv_std(nm))5�_�   6               7   1       ����                                                                                                                                                                                                                                                                                                                            ,           3   #       V       V�s    �   0   2   >         gradNm:copy(deriv_std(nm))5�_�   *           ,   +           ����                                                                                                                                                                                                                                                                                                                                                             V�[�     �      !   @         self.output = self.tmp:mean(�      "   @      d   self.output = self.tmp:mean(	self.output = self.output + add((1- self.lambda) * (m_std + nm_std))5�_�                   ,       ����                                                                                                                                                                                                                                                                                                                                                             V�ZM     �   +   -        5�_�                     ,       ����                                                                                                                                                                                                                                                                                                                                                             V�ZN     �   +   ,   >      	�   +   -   ?       �   *   -   ?      %	local m, nm = slice_input(self.tmp)l5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             V�Y�     �         >      	�         >      :function DrLimCentSTDCriterion:updateOutput(input, target	5��