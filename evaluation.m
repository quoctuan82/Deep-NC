function [PSNR,SSIM,NIQE,PIQE] = evaluation(I_dec, I_org)
%evaluation: mix two messages
%   I_dec: decoded image
%   I_org: orginal image
% Outputs:
%   PSNR: Peak Signal-to-Noise Ratio 
%   SSIM: Structural Similarity Index
%   NIQE: Naturalness Image Quality Evaluator 
%   PIQE: Perception based Image Quality Evaluator

PSNR = psnr(I_dec, I_org);
SSIM = ssim(I_dec, I_org);
NIQE = niqe(I_dec);
PIQE = piqe(I_dec);
end
