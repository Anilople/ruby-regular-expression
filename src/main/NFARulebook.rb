require 'set'
require_relative 'FARule'

class NFARulebook < Struct.new(:rules)

    # states -- 一些输入状态
    # 返回 states在经过多条规则后，变成的多个状态
    def next_states(states, character)
        states.flat_map { |state| follow_rules_for(state, character) }.to_set
    end

    # 返回  state在输入character后，
    #       能变成的多个状态
    def follow_rules_for(state, character)
        rules_for(state, character).map(&:follow)
    end

    # 找出多条规则
    # 满足输入状态为state，输入字符为character
    def rules_for(state, character)
        rules.select { |rule| rule.applies_to?(state, character) }
    end
end