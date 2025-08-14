# TL;DR:

In this repo:

```
$ git clone git@github.com:llvm/llvm-project.git /tmp/llvm-project 
$ pushd llvm-project 
$ IFS= read -r -d '' x <emreg.py
$ git filter-repo \
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
   
 $ popd
$ git remote add upstream /tmp/llvm-project
$ git pull upstream main
$ git remote add origin https://github.com/makslevental/python_bindings_fork
$ git push -u origin main -f
```

In the other repo:

```
$ git remote add upstream git@github.com:makslevental/python_bindings_fork.git
$ git subtree add -P $WHEREVER_YOU_WANT upstream main
```

Note, you will have to have at least one commit for this to work in the "other repo"; do `git commit --allow-empty -m 'Initial commit'` if not.

Then to pull changes from "this" repo:

```
$ git subtree pull -P $WHEREVER_YOU_WANT upstream main
```

# Requires 

https://github.com/newren/git-filter-repo
