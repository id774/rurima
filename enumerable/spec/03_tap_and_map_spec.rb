#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'rubygems'
require 'rspec'
require '03_tap_and_map'

describe Rurima_03, 'tap and map の改善' do
  context 'で大文字のキーによるハッシュを渡すと' do
    it 'キーが小文字になって返る' do
      options = { 'FOO' => 'BAR', 'HOGE' => 'FUGA'}
      except = { 'foo' => 'BAR', 'hoge' => 'FUGA'}
      Rurima_03.improvement(options) == except
    end
  end
end
