# Somemodel.conditions => Array or nil
# target => given parameter (must be symbol)

require 'active_record'

class Model < ActiveRecord::Base
end

ActiveRecord::Base.establish_connection(
  :adapter  => "sqlite3",
  :database => "sqlite.db"
)

class Rurima_02
  class << self
    def original(target)
      result = []
      records = Model.where(:flag => true)
      records.each do |r|
        if !r.conditions
          result << r
        elsif r.conditions.include?(target)
          result << r
        end
      end
      result
    end

    def improvement(target)
      records = Model.where(:flag => true)
      records.select {|r| !r.conditions || r.conditions.include?(target)}
    end
  end
end
