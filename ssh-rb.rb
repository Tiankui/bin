#!/usr/bin/env ruby

require "mechanize"

http = Mechanize.new

http.verify_mode = OpenSSL::SSL::VERIFY_NONE
meeting_date = "2012-05-04"
time_start = "h1=18&m1=00"
time_end = "h2=19&m2=30"
uri = "https://is.taobao.org/meeting/MeetingRoomBookingEdit.aspx?roomid=ac1ff05c-acad-4ecc-950d-726309fb5788&date=#{meeting_date}&#{time_start}&#{time_end}&from=room"
  puts uri
http.get(uri) do |login|
  #进入登陆页面
  login.forms[0].tbPassword = "ZWP$27890"
  login.forms[0].tbLoginName = "tiankui.zwp"
  meeting = login.forms[0].submit 
  #进入定会议室页面
  sb_form = meeting.forms[0]
  puts sb_form.buttons[1]
  
  sb_form.submit(sb_form.buttons[1])
end

