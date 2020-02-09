require_relative "../../main/re/Choose"
require_relative "../../main/re/Concatenate"
require_relative "../../main/re/Empty"
require_relative "../../main/re/Literal"
require_relative "../../main/re/Pattern"
require_relative "../../main/re/Repeat"

pattern = Repeat.new(
    Choose.new(
        Concatenate.new(Literal.new('a'), Literal.new('b')),
        Literal.new('a')
    )
)

puts pattern # (ab|a)*

pattern = Repeat.new(
    Concatenate.new(
        Literal.new('a'),
        Choose.new(
            Empty.new, Literal.new('b')
        )
    )
)

puts pattern # (a(|b))*

puts pattern.matches?('') # true
puts pattern.matches?('a') # true
puts pattern.matches?('ab') # true
puts pattern.matches?('aba') # true
puts pattern.matches?('abab') # true
puts pattern.matches?('abaab') # true
puts pattern.matches?('abba') # false