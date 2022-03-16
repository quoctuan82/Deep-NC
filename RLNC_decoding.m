function [I_dec] = RLNC_decoding(RLNC_coeff,I_Rx,I_shared_datastore,I_shared_idx)
%RLNC_decoding: decode message
%   RLNC_coeff (1x2): random RLNC coefficients
%   I_Rx: received image
%   I_shared_datastore: shared image data store between genuine users
%   I_shared_idx: index of the image in shared data store
% Outputs:
%   I_dec: decoded image with RLNC decoding

% Load the pretrained DnCNN network
dn_net = denoisingNetwork('dncnn');
I_Rx_denoise = Denoise_PretrainedNetwork(I_Rx,dn_net);

I_shared = im2double(readimage(I_shared_datastore,I_shared_idx));

% resize the shared image to the same size of the original image
[nrows,ncols,np] = size(I_Rx);
I_shared_resize = imresize(I_shared,[nrows ncols],'bicubic');

I_dec = (I_Rx_denoise-RLNC_coeff(2)*I_shared_resize)/RLNC_coeff(1);
end

