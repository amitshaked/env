Vim�UnDo� ���T�%� z����`�J�ƨ�Pv{�h~c   3                              
    V�Z�    _�                     	       ����                                                                                                                                                                                                                                                                                                                                                             V�T�     �      
   3         self.lambda = 0.55�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                             V�T�     �      
   3         self.lambda = .55�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                             V�T�     �      
   3         self.lambda = 55�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                             V�T�    �      
   3         self.lambda = 5�_�                    3       ����                                                                                                                                                                                                                                                                                                                                                             V�WW     �               3   require 'math'   Wlocal DrLimCentCriterion, parent = torch.class('nn.DrLimCentCriterion', 'nn.Criterion')       $function DrLimCentCriterion:__init()      parent.__init(self)       self.tmp = torch.CudaTensor()   &   self.gradInput = torch.CudaTensor()   *   self.margin = opt and opt.margin or 0.2   +   self.lambda = opt and opt.lambda or 0.8    end       7function DrLimCentCriterion:updateOutput(input, target)       I	assert(input:size(2) == 1 and input:size(3) == 1 and input:size(4) == 1)   %	self.tmp:resizeAs(input):copy(input)   $	local m, nm = slice_input(self.tmp)       $	-- Add score for non matching pairs   1   nm:pow(2):mul(-1):add(self.margin*self.margin)      self.gt = torch.gt(nm, 0)      nm:cmul(self.gt)      nm:mul(self.lambda)       "   -- Add score for matching pairs      m:pow(2)      m:mul(self.lambda)           self.output = self.tmp:mean()      return self.output   end       :function DrLimCentCriterion:updateGradInput(input, target)   !  	-- (1- target)*lambda*2*input    ,	-- + target*lambda*2*max{0, input - margin}   *	-- + (n * x_i - sum(x_j)) / (n*(n-1)*std)   I	assert(input:size(2) == 1 and input:size(3) == 1 and input:size(4) == 1)   %	self.tmp:resizeAs(input):copy(input)   $	local m, nm = slice_input(self.tmp)        (   self.gradInput:resizeAs(input):zero()   4   local gradM, gradNm = slice_input(self.gradInput)             --Add grad for matching pairs   7   gradM:add(torch.mul(m, 2*self.lambda/input:size(1)))       %   -- Add grad for non matching pairs   O   gradNm:add(torch.cmul(self.gt, torch.mul(nm, -2*self.lambda/input:size(1))))          return self.gradInput         end5�_�                    	   +    ����                                                                                                                                                                                                                                                                                                                                                             V�Y�    �      
   3      +   self.lambda = opt and opt.lambda or 0.8 5�_�                    (        ����                                                                                                                                                                                                                                                                                                                                                             V�Z�     �   '   )   3      (   self.gradInput:resizeAs(input):zero()5�_�      	              (        ����                                                                                                                                                                                                                                                                                                                                                             V�Z�     �   '   )   3      '  self.gradInput:resizeAs(input):zero()5�_�      
           	   (        ����                                                                                                                                                                                                                                                                                                                                                             V�Z�     �   '   )   3      & self.gradInput:resizeAs(input):zero()5�_�   	              
   (        ����                                                                                                                                                                                                                                                                                                                                                             V�Z�    �   '   )   3      %self.gradInput:resizeAs(input):zero()5�_�   
                  2        ����                                                                                                                                                                                                                                                                                                                                                             V�Z�    �   1   4        5��