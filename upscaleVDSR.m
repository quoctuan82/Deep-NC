function [I_VDSR,I_residual] = upscaleVDSR(I_lowres,I_org_size,net)
%upscaleVDSR Recover image with improved image resolution using pretrained VDSR network
%   I_lowres: low-resolution image
%   I_org_size: size of original image, i.e. [nrows ncols]
%   net: pretrained VDSR network
% Output: 
%   I_VDSR: high-resolution image with VDSR
%   I_residual: residual image


% Recall that VDSR is trained using only the luminance channel of an image because human perception is more sensitive to changes in brightness than to changes in color.
% Convert the low-resolution image from the RGB color space to luminance (Iy) and chrominance (Icb and Icr) channels by using the rgb2ycbr function.
I_lowres_ycbcr = rgb2ycbcr(I_lowres);
I_lowres_y = I_lowres_ycbcr(:,:,1);
I_lowres_cb = I_lowres_ycbcr(:,:,2);
I_lowres_cr = I_lowres_ycbcr(:,:,3);

% Upscale the luminance and two chrominance channels using bicubic interpolation.
% The upsampled chrominance channels, Icb_bicubic and Icr_bicubic, require no further processing.
I_lowres_y_bicubic = imresize(I_lowres_y,I_org_size,'bicubic');
I_lowres_cb_bicubic = imresize(I_lowres_cb,I_org_size,'bicubic');
I_lowres_cr_bicubic = imresize(I_lowres_cr,I_org_size,'bicubic');

% Pass the upscaled luminance component, Iy_bicubic, through the trained VDSR network. 
% Observe the activations from the final layer (a regression layer). The output of the network is the desired residual image.
I_residual = double(activations(net,I_lowres_y_bicubic,41));

% Add the residual image to the upscaled luminance component to get the high-resolution VDSR luminance component.
I_lowres_sr = I_lowres_y_bicubic + I_residual;

% Concatenate the high-resolution VDSR luminance component with the upscaled color components. 
% Convert the image to the RGB color space by using the ycbcr2rgb function. The result is the final high-resolution color image using VDSR.
I_VDSR = ycbcr2rgb(cat(3,I_lowres_sr,I_lowres_cb_bicubic,I_lowres_cr_bicubic));
end

