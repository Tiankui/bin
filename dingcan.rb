#!/usr/bin/env ruby
#coding=utf-8
require "mechanize"


M = Mechanize

def prompt
  print "不要钱的饭> "
end

puts "\n#{"-"*30} 哥！订饭吗？#{"-"*30}\n#{"-"*31} yes or no #{"-"*31}\n\n"

prompt;ding = gets.chomp

fan = M.new

if ding == "yes"
  fan.get('http://bjdc.taobao.ali.com/') do |p|
    
    p.form_with(:action => '/node/15?destination=node%2F15') do |f|
      
      f.field_with(:name => "name").value = "tiankui.zwp"
      f.field_with(:name => "pass").value = "ZWP$27890"
      
      _next = f.submit

      link = _next.link_with(:href => "/dingcan")
      
      if link
        link.click
        puts "订餐完毕！谢谢使用"
      else
        puts "您已经定过了" if _next.link_with(:href=>"/budingcan")
      end
    end
  end
else
  puts "好吧"
end

