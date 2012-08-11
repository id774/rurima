#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'rubygems'
require 'rspec'
require '02_each_and_include'
require 'active_record'

class Model < ActiveRecord::Base
end

describe Rurima_02, 'find 結果の .each メソッドの改善' do
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

  context 'で問題のコードにてメンタルを病んだ人間を選択すると' do
    it 'メンタルを病んだ人間が選択される' do
      expect = Model.find(3)
      Rurima_02.original("mental health") == expect
    end
  end

  context 'で改善されたコードにてメンタルを病んだ人間を選択すると' do
    it 'メンタルを病んだ人間が選択される' do
      expect = Rurima_02.original("mental health")
      Rurima_02.improvement("mental health") == expect
    end
  end

  after do
    db_dir = File.join(File.dirname(__FILE__), '..')
    db = File.join(db_dir, 'sqlite.db')
    File.delete(db) if File.exist?(db)
  end
end
