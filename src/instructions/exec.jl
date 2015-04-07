EXEC_EQ(s::State) = if length(s.exec) >= 2
  push!(s.boolean, pop!(s.exec) === pop!(s.exec))
end

#
# TODO
#
EXEC_DEFINE(s::State) = if !isempty(s.name) && !isempty(s.exec)
  register(s, pop!(s.name), pop!(s.exec)) 
end

#
# TODO
#
EXEC_DO_STAR_COUNT(s::State) = return

#
# TODO
#
EXEC_DO_STAR_RANGE(s::State) = return

#
# TODO
#
EXEC_DO_STAR_TIMES(s::State) = return

# What if "EXEC_DUP" is the command being duplicated?
# Should we allow it to be cloned?
EXEC_DUP(s::State) = if !isempty(s.exec)
  push!(s.exec, peek(s.exec))
end

EXEC_FLUSH(s::State) = clear!(s.exec)

EXEC_IF(s::State) = if !isempty(s.boolean) && length(s.exec) >= 2
  a = pop!(s.exec)
  b = pop!(s.exec)
  push!(s.exec, pop!(s.boolean) ? a : b)
end

# What happens when we're dealing with lists?
EXEC_K(s::State) = if length(s.exec) >= 2
  s.exec[1] = pop!(s.exec)
end

EXEC_POP(s::State) = pop!(s.exec)

EXEC_ROT(s::State) = if length(s.exec) >= 3
  s.exec[3], s.exec[1] = s.exec[1], s.exec[3]
end

#
# TODO
#
EXEC_S(s::State) = if length(s.exec) >= 3
  a = pop!(s.exec)
  b = pop!(s.exec)
  c = pop!(s.exec)

  # (B C) C A ?
end

#
# TODO
#
EXEC_SHOVE(s::State) = return

EXEC_STACK_DEPTH(s::State) = push!(s.integer, length(s.exec))

EXEC_SWAP(s::State) = if length(s.exec) >= 2
  s.exec[1], s.exec[2] = s.exec[2], s.exec[1]
end

EXEC_Y(s::State) = if !isempty(s.exec)
  top = pop!(s.exec)
  # (EXEC.Y <top>)
  push!(s.exec, top)
end

#
# TODO
#
EXEC_YANK(s::State) = return

#
# TODO
#
EXEC_YANK_DUP(s::State) = return

Push.register("EXEC.=",          EXEC_EQ)
Push.register("EXEC.DEFINE",     EXEC_DEFINE)
Push.register("EXEC.DO*COUNT",   EXEC_DO_STAR_COUNT)
Push.register("EXEC.DO*RANGE",   EXEC_DO_STAR_RANGE)
Push.register("EXEC.DO*TIMES",   EXEC_DO_STAR_TIMES)
Push.register("EXEC.DUP",        EXEC_DUP)
Push.register("EXEC.FLUSH",      EXEC_FLUSH)
Push.register("EXEC.IF",         EXEC_IF)
Push.register("EXEC.K",          EXEC_K)
Push.register("EXEC.POP",        EXEC_POP)
Push.register("EXEC.ROT",        EXEC_ROT)
Push.register("EXEC.S",          EXEC_S)
Push.register("EXEC.SHOVE",      EXEC_SHOVE)
Push.register("EXEC.STACKDEPTH", EXEC_STACK_DEPTH)
Push.register("EXEC.SWAP",       EXEC_SWAP)
Push.register("EXEC.Y",          EXEC_Y)
Push.register("EXEC.YANK",       EXEC_YANK)
Push.register("EXEC.YANKDUP",    EXEC_YANK_DUP)