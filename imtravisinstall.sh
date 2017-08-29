#!/usr/bin/env bash
set -ex
wget https://www.imagemagick.org/download/ImageMagick-7.0.5-10.tar.gz
tar -xzvf ImageMagick-7.0.5-10.tar.gz
cd ImageMagick-7.0.5-10 && ./configure --prefix=/usr && make && sudo make install
