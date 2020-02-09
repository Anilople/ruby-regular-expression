require_relative 'Pattern'
require_relative '../FARule'
require_relative '../NFADesign'
require_relative '../NFARulebook'

# |，并联，或
class Choose < Struct.new(:first, :second)
    include Pattern

    def to_s
        ([first, second].map { |pattern| pattern.bracket(precedence) }).join('|')
    end

    def precedence
        0
    end

    def to_nfa_design
        first_nfa_design = first.to_nfa_design
        second_nfa_design = second.to_nfa_design

        start_state = Object.new
        accept_states = first_nfa_design.accept_states + second_nfa_design.accept_states

        rules = first_nfa_design.rulebook.rules + second_nfa_design.rulebook.rules

        # start_state通过free move到2个NFA的开始状态
        extra_rules = [
            FARule.new(start_state, nil, first_nfa_design.start_state),
            FARule.new(start_state, nil, second_nfa_design.start_state)
        ]

        rulebook = NFARulebook.new(rules + extra_rules)

        NFADesign.new(start_state, accept_states, rulebook)
    end
end