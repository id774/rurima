# -*- coding: utf-8 -*-

class Rurima
  class << self
    def randomize(array)
      array.shuffle
    end

    def member_shuffle(members)
      shuffled = randomize members
      group_a = shuffled.take(members.size/2)
      group_b = members - group_a
      return group_a, group_b
    end
  end
end
