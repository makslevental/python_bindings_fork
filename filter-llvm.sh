#!/usr/bin/env bash

#rm -rf .git
#rm -rf mlir
#git init
#git checkout -b main

emreg=$(cat <<EOF

import re;

r = re.compile(r"(?P<name>[-!#-'*+/-9=?A-Z^-~]+(\.[-!#-'*+/-9=?A-Z^-~]+)*|\"([]!#-[^-~ \t]|(\\[\t -~]))+\")@(?P<domain>[-!#-'*+/-9=?A-Z^-~]+(\.[-!#-'*+/-9=?A-Z^-~]+)*|\[[\t -Z^-~]*])");
rr = re.compile(r"@(?P<name>[a-z\d](?:[a-z\d]|-(?=[a-z\d])){0,38})(?=\b)");

message = message.decode("utf-8");
message = r.sub(r"\g<name>$$$\g<domain>", message);
message = rr.sub(r"\g<name>", message);
message = message.replace("$$$", "@");

return message.encode("utf-8")

EOF
)

git replace --graft 0f0d0ed1c78f1a80139a1f2133fad5284691a121 5b4a01d4a63cb66ab981e52548f940813393bf42

git filter-repo \
  --path mlir/include/mlir/Bindings/Python \
  --path mlir/include/mlir/CAPI \
  --path mlir/include/mlir-c \
  --path mlir/lib/Bindings/Python \
  --path mlir/lib/CAPI \
  --path mlir/lib/Bindings/Python \
  --path mlir/python \
  --path mlir/tools/mlir-tblgen \
  --message-callback "$emreg" \
  --force

#git remote add -f upstream /tmp/llvm-project
#git pull upstream main
#git remote add origin git@github.com:makslevental/python_bindings_fork.git
#git push -u origin main -f
