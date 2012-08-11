#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'rubygems'
require 'rspec'
require '04_tap_and_each'
require 'active_record'

class Model < ActiveRecord::Base
end

describe Rurima_04, 'tap and each の改善' do
  before do
    ActiveRecord::Base.establish_connection(
      :adapter  => "sqlite3",
      :database => "sqlite.db"
    )
    ActiveRecord::Migration.create_table :models, :force => true do |t|
      t.column :id, :integer
      t.column :name, :string
      t.column :flag, :boolean
      t.column :conditions, :text
    end
    def test_data
      m = Model.new
      m.name = "Yamada"
      m.flag = true
      m.conditions = "sick"
      m.save!
      m = Model.new
      m.name = "Tanaka"
      m.flag = false
      m.conditions = "health"
      m.save!
      m = Model.new
      m.name = "Suzuki"
      m.flag = true
      m.conditions = "mental health"
      m.save!
    end
    test_data
  end

  context 'で改善されたコードにてメンタルを病んでいない人間を選択すると' do
    it 'メンタルを病んでいない人間が選択される' do
      names = [:Yamada, :Tanaka]
      expect = Rurima_04.original(names)
      Rurima_04.improvement(names).should == expect
    end
  end

  after do
    db_dir = File.join(File.dirname(__FILE__), '..')
    db = File.join(db_dir, 'sqlite.db')
    File.delete(db) if File.exist?(db)
  end
end
