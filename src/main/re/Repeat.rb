require_relative 'Pattern'
require_relative '../FARule'
require_relative '../NFADesign'
require_relative '../NFARulebook'

# pattern*
class Repeat < Struct.new(:pattern)
    include Pattern

    def to_s
        pattern.bracket(precedence) + "*"
    end

    def precedence
        2
    end

    def to_nfa_design
        pattern_nfa_design = pattern.to_nfa_design

        start_state = Object.new
        accept_states = [start_state] + pattern_nfa_design.accept_states

        rules = pattern_nfa_design.rulebook.rules

        # pattern的accept_states通过free move到pattern的start_state
        # 新的start_state通过free move到pattern的start_state
        extra_rules = pattern_nfa_design.accept_states.map{
            |accept_state| FARule.new(accept_state, nil, pattern_nfa_design.start_state)
        } + [
            FARule.new(start_state, nil, pattern_nfa_design.start_state)
        ]

        rulebook = NFARulebook.new(rules + extra_rules)

        NFADesign.new(start_state, accept_states, rulebook)
    end
end