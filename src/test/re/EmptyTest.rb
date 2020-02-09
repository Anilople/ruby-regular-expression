require_relative "../../main/re/Empty"

nfa_design = Empty.new.to_nfa_design
puts nfa_design
puts nfa_design.accepts?('') # true
puts nfa_design.accepts?('a') # false

# matches?
puts Empty.new.matches?('a') # false