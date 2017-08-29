#!/usr/bin/env bash
set -ex
wget https://www.imagemagick.org/download/ImageMagick.tar.gz
tar -xzvf ImageMagick.tar.gz
cd ImageMagick-7.0.6-10 && ./configure --prefix=/usr && make && sudo make install
