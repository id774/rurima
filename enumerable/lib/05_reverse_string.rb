# -*- coding: utf-8 -*-

class Rurima_05
  class << self
    def normal_reverse(string)
      string.reverse
    end

    def reverse_string(string)
      string.split("").inject([]) {|array, c| array.unshift(c) }.join("")
    end
  end
end
