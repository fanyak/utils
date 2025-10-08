pip install --upgrade uv # uv self update

# install the python interpreter within the environment managed by uv
uv python upgrade 3.14

# This is a tool similar to npx in the JavaScript ecosystem.
# It is used to execute a package command without globally
# installing the package or managing its environment permanently.
# This is useful for running a script or command with a specific Python version 
# without affecting your main or global environment. !!!!
# It's often used for one-off tasks or scripts that require a specific version of Python.
uvx python@3.14 