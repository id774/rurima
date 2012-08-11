#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'rubygems'
require 'rspec'
require '01_shuffle'

describe Rurima_01, 'テーマ：与えられた配列を適当に並べ替えて２分割してください。' do
  before do
    class Rurima_01
      class << self
        def randomize(array)
          array
        end
      end
    end
  end

  context 'で 10 人の参加者を配列として渡すと' do
    it '10 人の参加者が 2 つに分割された配列が返る' do
      expect = [[0, 1, 2, 3, 4], [5, 6, 7, 8, 9]]
      members = 10.times.to_a
      Rurima_01.member_shuffle(members).should == expect
    end
  end

  context 'で 11 人の参加者を配列として渡すと' do
    it '11 人の参加者が 2 つに分割された配列が返る' do
      expect = [[0, 1, 2, 3, 4], [5, 6, 7, 8, 9, 10]]
      members = 11.times.to_a
      Rurima_01.member_shuffle(members).should == expect
    end
  end
end
