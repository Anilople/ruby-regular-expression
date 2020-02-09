require_relative "../../main/re/Literal"
require_relative "../../main/re/Repeat"

pattern = Repeat.new(Literal.new('a'))

puts pattern # a*

puts pattern.matches?('') # true

puts pattern.matches?('a') # true

puts pattern.matches?('aaaa') # true

puts pattern.matches?('b') # false