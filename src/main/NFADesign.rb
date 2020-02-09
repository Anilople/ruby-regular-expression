require_relative 'NFA'

# 根据需要，自动产生新的NFA实例
class NFADesign < Struct.new(:start_state, :accept_states, :rulebook)
    def accepts?(string)
        (to_nfa.tap { |nfa| nfa.read_string(string) }).accepting?
    end

    def to_nfa
        NFA.new(Set[start_state], accept_states, rulebook)
    end
end