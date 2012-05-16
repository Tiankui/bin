#!/usr/bin/env ruby
# encoding: utf-8

require "net/https"

uri = URI.parse("https://ark.taobao.org:4430/arkserver/Login.aspx?app=http%3a%2f%2fis.taobao.org%2fmeeting&amp;redirectURL=http%3a%2f%2fis.taobao.org%2fmeeting%2fdefault.aspx")
http = Net::HTTP.new(uri.host,uri.port)

#使用OpenSSL时，必须设置use_ssl和验证模式
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
#带上用户名和密码，进行登录
puts "正在请求 #{uri.host} 端口 #{uri.port}\n路径 #{uri.path}"

req = Net::HTTP::Get.new("url.path")
response = http.request(req)
puts response.body

#TODO
#带上cookie进行会议室定位设置


#TODO
#定会议室逻辑待观察
