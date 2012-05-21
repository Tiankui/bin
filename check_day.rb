#!/usr/bin/env ruby
#coding = utf-8
#预订逻辑是可以预定15天之内的，所以检测逻辑要判断当前日期往后的第16天

  
module CheckDay
  def self.find_day
    now = Time.new
    book_time = now + 60*60*24*16
    if book_time.wday == 5
      yield book_time
    else
      p '16天后是星期#{book_time.wday}'
    end
  end
end

