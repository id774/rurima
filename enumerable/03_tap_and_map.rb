# @option is parsed query parameter
# e.g. { 'foo' => 'bar', 'hoge' => 'piyo'

require 'pp'
@option = { 'FOO' => 'BAR', 'HOGE' => 'PIYO'}
h = {}
pp @option.map{|k,v|[k.to_s.downcase,v]}.each_with_object(h){|(k,v),h|h[k]=v}
