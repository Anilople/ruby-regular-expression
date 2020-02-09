require_relative "../../main/re/Choose"
require_relative "../../main/re/Literal"

pattern = Choose.new(Literal.new('a'), Literal.new('b'))

puts pattern # a|b

puts pattern.matches?('a') # true

puts pattern.matches?('b') # true

puts pattern.matches?('c') # false