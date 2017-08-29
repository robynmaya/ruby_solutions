=begin
Unlucky Days

Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

Examples:

friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2
=end

def friday_13th?(year)
  friday_13th_count = 0

  1.upto(12) do |month|
    friday_13th_count += 1 if Time.local(year, month, 13).friday?
  end

  friday_13th_count
end
