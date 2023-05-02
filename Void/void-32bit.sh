#!/bin/bash
set -eu
sudo xbps-install -Sy void-repo-multilib-nonfree void-repo-multilib
sudo xbps-install -Sy nvidia-libs-32bit vulkan-loader-32bit libdrm-32bit
sudo ldconfig
