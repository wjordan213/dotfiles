pylint --init-hook " import os; import sys; PY_V = sys.version[0]; _f = os.path.join(\"$VIRTUAL_ENV\", \"bin/activate_this.py\"); read_cmd = open(_f).read() if PY_V == \"3\" else open(_f); exec(read_cmd, dict(__file__=_f))"