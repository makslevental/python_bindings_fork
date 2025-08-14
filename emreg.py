import re;

r = re.compile(r"(?P<name>[-!#-'*+/-9=?A-Z^-~]+(\.[-!#-'*+/-9=?A-Z^-~]+)*|\"([]!#-[^-~ \t]|(\\[\t -~]))+\")@(?P<domain>[-!#-'*+/-9=?A-Z^-~]+(\.[-!#-'*+/-9=?A-Z^-~]+)*|\[[\t -Z^-~]*])");
rr = re.compile(r"@(?P<name>[a-z\d](?:[a-z\d]|-(?=[a-z\d])){0,38})(?=\b)");

message = message.decode("utf-8");
message = r.sub(r"\g<name>$$$\g<domain>", message);
message = rr.sub(r"\g<name>", message);
message = message.replace("$$$", "@");

return message.encode("utf-8")
