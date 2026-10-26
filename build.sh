#!/bin/bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

echo "=== 1. Building Qt GUI Application ==="
cmake -B PresentationLayer/build -S PresentationLayer
cmake --build PresentationLayer/build

echo "=== 2. Building CLI Application ==="
clang++ -std=c++17 -O2 \
  -DSTB_IMAGE_STATIC -DSTB_IMAGE_WRITE_STATIC \
  $(find Application -name "*.cpp") \
  PresentationCLILayer/Image_Filter_Implementation.cpp \
  -IApplication \
  -o ImageFilterCLI

echo ""
echo "=== Build Complete! ==="
echo "To run Qt GUI : ./run_gui.sh  (or: open PresentationLayer/build/PresentationLayer.app)"
echo "To run CLI    : ./ImageFilterCLI"
