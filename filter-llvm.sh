#!/usr/bin/env bash

#rm -rf .git
#rm -rf mlir
#git init
#git checkout -b main
#git remote add -f origin /tmp/llvm-project
#git pull origin main

IFS= read -r -d '' x <emreg.py

git replace --graft 0f0d0ed1c78f1a80139a1f2133fad5284691a121 5b4a01d4a63cb66ab981e52548f940813393bf42

git filter-repo \
  --path mlir/include/mlir/Bindings/Python \
  --path mlir/include/mlir/CAPI \
  --path mlir/include/mlir-c \
  --path mlir/lib/Bindings/Python \
  --path mlir/lib/CAPI \
  --path mlir/lib/Bindings/Python \
  --path mlir/python \
  --path tools/mlir-tblgen \
  --message-callback "$x" \
  --force
