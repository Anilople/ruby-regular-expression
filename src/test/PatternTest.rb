require_relative "../main/re/Choose"
require_relative "../main/re/Concatenate"
require_relative "../main/re/Empty"
require_relative "../main/re/Literal"
require_relative "../main/re/Pattern"
require_relative "../main/re/Repeat"

pattern = Repeat.new(
    Choose.new(
        Concatenate.new(Literal.new('a'), Literal.new('b')),
        Literal.new('a')
    )
)

puts pattern # (ab|a)*