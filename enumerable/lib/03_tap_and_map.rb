# -*- coding: utf-8 -*-

class Rurima_03
  class << self
    def original(option)
      {}.tap do |hash|
        option.map do |k,v|
          hash[k.to_s.downcase(:lower)] = v
        end
      end
    end

    def improvement(options)
      options.keys.each_with_object({}){|k,h|
        h[k.to_s.downcase] = options[k]
      }
    end
  end
end
