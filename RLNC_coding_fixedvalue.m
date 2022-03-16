function [I_mixed,RLNC_coeff] = RLNC_coding_fixedvalue(RLNC_coeff,I_org,I_shared_datastore,I_shared_idx)
%RLNC_coding: mix two messages
%   RLNC_coeff_range (1x2): range of RLNC coefficients for mixing, e.g. [1 100]
%   I_org: original image (after downscaled) to be sent
%   I_shared_datastore: shared image data store between genuine users
%   I_shared_idx: index of the image in shared data store
% Outputs:
%   I_mixed: image mixed with RLNC
%   RLNC_coeff (1x2): random RLNC coefficients in RLNC_coeff_range

I_shared = im2double(readimage(I_shared_datastore,I_shared_idx));

% resize the shared image to the same size of the original image
[nrows,ncols,np] = size(I_org);
I_shared_resize = imresize(I_shared,[nrows ncols],'bicubic');

%RLNC_coeff = randi(RLNC_coeff_range,1,2)/(max(RLNC_coeff_range));
I_mixed = RLNC_coeff(1)*I_org + RLNC_coeff(2)*I_shared_resize;
end

