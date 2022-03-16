# Deep-NC
## A secure image transmission using deep learning and network coding

This program shows a demo for our paper ["Deep-NC: A secure image transmission using deep learning and network coding"](https://doi.org/10.1016/j.image.2021.116490) published in [Signal Processing: Image Communication](https://www.sciencedirect.com/journal/signal-processing-image-communication)

# Requirements 
1) MATLAB Deep Learning Toolbox 
2) MATLAB Image Processing Toolbox 
3) (optional) MATLAB Parallel Computing Toolbox (if CUDA-capable NVIDIA™ GPU is used to train the VDSR network) 

# Run the Demo
1) Download all files to the same working folder
2) Open MATLAB live script file "DeepNC_VDSR_Paper_Demo.mlx"
3) The first section of the code is for downloading the training dataset, which may take long. So, if you do not want to download it, then you can load the pretrained VDSR network which is also provided by commenting that section and replacing it by 
  
  load('trainedVDSR-22-May-2020-02-01-41-Epoch-100-ScaleFactors-23468X.mat'); 

# Citation
If you refer to the above code, please cite the following work:
```
@article{VIEN2021116490,
author = {Quoc-Tuan Vien and Tuan T. Nguyen and Huan X. Nguyen},
title = {Deep-NC: A secure image transmission using deep learning and network coding},
journal = {Signal Processing: Image Communication},
volume = {99},
pages = {116490},
year = {2021},
issn = {0923-5965},
doi = {https://doi.org/10.1016/j.image.2021.116490},
url = {https://www.sciencedirect.com/science/article/pii/S0923596521002381},
keywords = {Image communication, Deep learning, Super-resolution, Network coding},
}
```
