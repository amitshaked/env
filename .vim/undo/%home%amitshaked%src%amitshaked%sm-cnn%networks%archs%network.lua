Vim�UnDo� n!��X��QG�;�v��aq�IrJ�����X  \                                   XR��    _�                     �        ����                                                                                                                                                    4                                                                                                                                                                                                       XR�W     �   �   �  P       �   �   �  O    5�_�                    �        ����                                                                                                                                                    4                                                                                                                                                                                                       XR�X     �   �   �  Q       5�_�                    �   !    ����                                                                                                                                                    4                                                                                                                                                                                                       XR�g    �   �     Q      !function Network:getDescriptors()5�_�                    �       ����                                                                                                                                                    4                                                                                                                                                                                                       XR�z     �   �    S    �   �   �  S    5�_�                          ����                                                                                                                                                    4                                                                                                                                                                                                       XR��    �      [      	�      Z    5�_�                    �        ����                                                                                                                                                    4                                                                                                                                                                                                       XR��    �   �   �  \      !function Network:getDescriptors()5�_�                     �   &    ����                                                                                                                                                    4                                                                                                                                                                                                       XR��    �      \      	return output_l, output_r�      \      F	local output_r = self.net_te1:forward(x_batch[{{2}}]:clone()):clone()�       \      F	local output_l = self.net_te1:forward(x_batch[{{1}}]:clone()):clone()�   �    \      .	-- to reduce more memory use forward_and_free�   �     \      A	-- we compute them separatly in order to reduce the memory usage�   �   �  \      $	-- compute the two image decriptors5��