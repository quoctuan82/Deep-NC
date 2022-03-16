function DenoisedImage = Denoise_PretrainedNetwork(NoisyImage,PretrainedNet)
% Denoise image using a pretrained network

% Split the noisy RGB images into its individual color channels.
[noisyR1,noisyG1,noisyB1] = imsplit(NoisyImage);

% Use the pretrained network, e.g. dncnn, to remove noise from each color channel.
denoisedR1 = denoiseImage(noisyR1,PretrainedNet);
denoisedG1 = denoiseImage(noisyG1,PretrainedNet);
denoisedB1 = denoiseImage(noisyB1,PretrainedNet);

%Recombine the denoised color channels to form the denoised RGB image. 
DenoisedImage = im2double(cat(3,denoisedR1,denoisedG1,denoisedB1));
end

