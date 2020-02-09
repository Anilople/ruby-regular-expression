# NFA的状态
# :current_states   一系列当前状态
# :accept_states    一系列可接受状态（终止状态）
# :rulebook         一系列跳转规则
class NFA < Struct.new(:current_states, :accept_states, :rulebook)
    # 当前状态有很多个，终止状态也有很多个，
    # 如果当前状态中，存在属于终止状态里的状态，那么NFA终止
    # 返回 这个状态是否是可接受（终止）状态？
    def accepting?
        (current_states & accept_states).any?
    end

    def read_character(character)
        self.current_states = rulebook.next_states(current_states, character)
    end

    def read_string(string)
        string.chars.each do |character| read_character(character) end
    end
end