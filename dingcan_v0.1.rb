#!/usr/bin/env ruby
#coding=utf-8
require "mechanize"
require "./timer"

class DingFan
  def initialize
    @spider = Mechanize.new
  end
  def action
    @spider.get('http://bjdc.taobao.ali.com/') do |p|

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
  end
end
spider = DingFan.new
Timer.every_n_seconds(60*60) do
  spider.action
end
