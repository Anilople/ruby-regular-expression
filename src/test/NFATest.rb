require_relative '../main/NFARulebook'
require_relative '../main/NFA'

rulebook = NFARulebook.new([
    FARule.new(1, 'a', 1), FARule.new(1, 'b', 1), FARule.new(1, 'b', 2),
    FARule.new(2, 'a', 3), FARule.new(2, 'b', 3),
    FARule.new(3, 'a', 4), FARule.new(3, 'b', 4)
])

puts NFA.new(Set[1], [4], rulebook).accepting? # false

puts NFA.new(Set[1, 2, 4], [4], rulebook).accepting? # true

nfa = NFA.new(Set[1], [4], rulebook);
puts nfa.accepting? # false

nfa.read_character('b');
puts nfa.accepting? # false

nfa.read_character('a')
puts nfa.accepting? # false

nfa.read_character('b');
puts nfa.accepting? # true

nfa = NFA.new(Set[1], [4], rulebook)
puts nfa
puts nfa.accepting? # false

nfa.read_string("bbbbb")
puts nfa.accepting? # true