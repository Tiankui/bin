#!/usr/bin/env ruby
#coding = utf-8
require "mechanize"
require "./timer"
require "./check_day"
#time = Time.new + 60*60*24*15
#puts time if time.wday != 5

class Shipin
  def initialize(date,time_start,time_end)
    @meeting_date = date
    @time_start = time_start
    @time_end = time_end
    @uri = "https://is.taobao.org/meeting/MeetingRoomBookingEdit.aspx?roomid=ac1ff05c-acad-4ecc-950d-726309fb5788&date=#{@meeting_date}&#{@time_start}&#{@time_end}&from=room"
    @http = Mechanize.new

    puts "您正在请求 => #{@uri}\n日期\t=>\t#{@meeting_date}\n时间\t=>\t#{@time_start}\t #{@time_end}"
  end

  def book_room
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    @http.get(@uri) do |login|
      #登陆ARK系统
      login.forms[0].tbPassword = "ZWP$27890"
      login.forms[0].tbLoginName = "tiankui.zwp"
      meeting = login.forms[0].submit
      #会议室
      sb_form = meeting.forms[0]
      puts sb_form.buttons[0]
      sb_form.submit(sb_form.buttons[1])
    end
  end
end

Timer.every_n_seconds(60){
  CheckDay.find_day {|a|
    #puts a.year
    #puts a.month
    #puts a.day
    Shipin.new("#{a.year}-#{a.month}-#{a.day}","h1=15&m1=17","h2=19&m2=30").book_room
  }
}
