require 'treetop'

require_relative 'FARule'
require_relative 'NFARulebook'
require_relative 'NFA'
require_relative 'NFADesign'

require_relative "./re/Choose"
require_relative "./re/Concatenate"
require_relative "./re/Empty"
require_relative "./re/Literal"
require_relative "./re/Pattern"
require_relative "./re/Repeat"

Treetop.load("Pattern")

parser = PatternParser.new

parse_tree = parser.parse('(a(|b))*')
puts parse_tree

pattern = parse_tree.to_ast
puts pattern # (a(|b))*

puts pattern.matches?('abaab') # true

puts pattern.matches?('abba') # false