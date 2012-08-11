# -*- coding: utf-8 -*-

require 'active_record'

class Model < ActiveRecord::Base
end

ActiveRecord::Base.establish_connection(
  :adapter  => "sqlite3",
  :database => "sqlite.db"
)

class Rurima_04
  class << self
    def original(keys)
      {}.tap do |result|
        keys.each do |type|
          records = Model.where(name: type)
          result[type] = [].tap do |record_array|
            records.each do |record|
              r = record
              record_array.push r
            end
          end
        end
      end
    end

    def improvement(keys)
      keys.each_with_object({}){|k,h|
        h[k] = Model.where(:name => k)
      }
    end
  end
end
