using Push
using Base.Test

# Load the base configuration used by all tests.
cfg_path = joinpath(dirname(@__FILE__), "configuration/boolean.cfg")
cfg = Push.load_configuration(cfg_path)

# EQUALS.
s = run("(FALSE FALSE BOOLEAN.=)", cfg)
@test s.boolean == [true]

s = run("(FALSE TRUE BOOLEAN.=)", cfg)
@test s.boolean == [false]

# Program.
# - Configuration.
# - Input stacks.
# - Expected output stacks.