require_relative "../../main/re/Literal"

nfa_design = Literal.new('a').to_nfa_design
puts nfa_design
puts nfa_design.accepts?('') # false
puts nfa_design.accepts?('a') # true
puts nfa_design.accepts?('b') # false

# matches?
puts Literal.new('a').matches?('a') # true