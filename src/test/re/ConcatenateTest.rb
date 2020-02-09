require_relative "../../main/re/Concatenate"
require_relative "../../main/re/Literal"

pattern = Concatenate.new(Literal.new('a'), Literal.new('b'))

puts pattern # ab

puts pattern.matches?('a') # false

puts pattern.matches?('ab') # true

puts pattern.matches?('abc') # false