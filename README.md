# TL;DR:

In this repo:

```
$ git clone git@github.com:llvm/llvm-project.git
$ cd llvm-project 
$ git filter-repo --subdirectory-filter mlir/lib/Bindings/Python
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
