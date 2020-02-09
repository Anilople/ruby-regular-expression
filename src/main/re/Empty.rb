require_relative 'Pattern'

# 空的正则表达式
class Empty
    include Pattern

    def to_s
        ''
    end

    def precedence
        3
    end
end