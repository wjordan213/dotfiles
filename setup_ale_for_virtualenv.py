# replace the first argument of os.path.join with the output of `echo $VIRTUAL_ENV` in your pipenv or poetry shell.
# run this inside a pipenv or poetry shell

import os; import sys; PY_V = sys.version[0]; _f = os.path.join("/Users/harris.jordan/Library/Caches/pypoetry/virtualenvs/order-service-py3.7", "bin/activate_this.py"); read_cmd = open(_f).read() if PY_V == "3" else open(_f); exec(read_cmd, dict(__file__=_f))
