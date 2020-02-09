require_relative 'Pattern'

# |，并联，或
class Choose < Struct.new(:first, :second)
    include Pattern

    def to_s
        ([first, second].map { |pattern| pattern.bracket(precedence) }).join('|')
    end

    def precedence
        0
    end
end