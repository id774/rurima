# -*- coding: utf-8 -*-
# 文字列を逆順にして返す関数を作成してください。
# ただし Array#reverse, Array#reverse! は使用禁止です。

require 'pp'
a = [0,1,2,3,4,6,5]
b = []
a.map{|x|b.unshift x}
pp b
