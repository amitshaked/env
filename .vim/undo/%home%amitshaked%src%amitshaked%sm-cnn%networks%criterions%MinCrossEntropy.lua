Vim�UnDo� ��pvl�]!Gv�v�{�z�w�[�ئPJT��p       0   self.gradInput:view(self.lsm.gradInput, size)                             W�w(    _�                             ����                                                                                                                                                                                                                                                                                                                                                             W��     �                  �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             W���     �               ^cal CrossEntropyCriterion, Criterion = torch.class('nn.CrossEntropyCriterion', 'nn.Criterion')    �                �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             W���     �               ^cal CrossEntropyCriterion, Criterion = torch.class('nn.CrossEntropyCriterion', 'nn.Criterion')5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       W���    �                return nn.CrossEntropyCriterion�                =function CrossEntropyCriterion:updateGradInput(input, target)�   	             :function CrossEntropyCriterion:updateOutput(input, target)�                .function CrossEntropyCriterion:__init(weights)�                `local CrossEntropyCriterion, Criterion = torch.class('nn.CrossEntropyCriterion', 'nn.Criterion')5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       W���     �                  self.lsm = nn.LogSoftMax()5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       W���     �                  self.sm = nn.LogSoftMax()5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       W���     �                  self.sm = nn.ogSoftMax()5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                V       W���     �                  self.sm = nn.gSoftMax()5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                V       W���     �                  self.sm = nn.SoftMax()5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                                V       W���     �                  self.sm = nn.SoftMx()5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                V       W���    �                  self.sm = nn.SoftM()5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       W���     �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       W���    �                �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       W���    �                5�_�                       !    ����                                                                                                                                                                                                                                                                                                                                                V       W���    �               1   self.nll:updateOutput(self.lsm.output, target)5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       W���     �             �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V       W��      �                4   self.nll:updateGradInput(self.lsm.output, target)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       W��     �             �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V       W��     �                6   self.lsm:updateGradInput(input, self.nll.gradInput)5�_�                       +    ����                                                                                                                                                                                                                                                                                                                                                 V       W��    �                6   self.lsm:updateGradInput(input, self.nll.gradInput)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V       W�r�     �                   self.lsm:updateOutput(input)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V       W�r�    �                6   self.lsm:updateGradInput(input, self.log.gradInput)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V       W�t}     �                '	self.log:updateOutput(self.lsm.output)5�_�                       !    ����                                                                                                                                                                                                                                                                                                                                                 V       W�t�    �                4   self.nll:updateGradInput(self.lsm.output, target)5�_�                       #    ����                                                                                                                                                                                                                                                                                                                                                 V       W�u     �                3   self.nll:updateGradInput(self.sm.output, target)5�_�                       !    ����                                                                                                                                                                                                                                                                                                                                                 V       W�u     �                6   self.log:updateGradInput(input, self.nll.gradInput)5�_�                       *    ����                                                                                                                                                                                                                                                                                                                                                 V       W�u"   
 �                5   self.sm:updateGradInput(input, self.log.gradInput)5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V       W�w'    �                0   self.gradInput:view(self.lsm.gradInput, size)5��