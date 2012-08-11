#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'rubygems'
require 'rspec'
require '05_reverse_string'

describe Rurima_05, '文字列を逆順にして返す関数を作成してください。' do
  context 'normal_reverse メソッドに文字列を渡すと' do
    it '文字列が逆順になって返る' do
      Rurima_05.normal_reverse("abcdef").should == "fedcba"
    end
    it '数字と文字列も逆順になって返る' do
      Rurima_05.normal_reverse("ab3cd45").should == "54dc3ba"
    end
    it '数字と文字列と記号も逆順になって返る' do
      Rurima_05.normal_reverse("aa93493##jfj03^-3i0iw").should == "wi0i3-^30jfj##39439aa"
    end
    it '空行は空行のまま' do
      Rurima_05.normal_reverse("").should == ""
    end
  end
  context 'reverse_string メソッドに文字列を渡すと' do
    it '文字列が逆順になって返る' do
      Rurima_05.reverse_string("abcdef").should == "fedcba"
    end
    it '数字と文字列も逆順になって返る' do
      Rurima_05.reverse_string("ab3cd45").should == "54dc3ba"
    end
    it '数字と文字列と記号も逆順になって返る' do
      Rurima_05.reverse_string("aa93493##jfj03^-3i0iw").should == "wi0i3-^30jfj##39439aa"
    end
    it '空行は空行のまま' do
      Rurima_05.reverse_string("").should == ""
    end
  end
end
