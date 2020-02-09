# 自动机中的一条边，表示一条规则
# state在接受字符character的输入后，变为next_state
class FARule < Struct.new(:state, :character, :next_state)
    def inspect
        "#<FARule #{state.inspect} --#{character}--> #{next_state.inspect}>"
    end

    # 这个规则能否在状态为state，输入为character时使用？
    def applies_to?(state, character)
        self.state == state && self.character == character
    end

    # 返回下一状态
    def follow
        next_state
    end
end