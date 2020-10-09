require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new('Chair.co', 'Tim', 'chair.com')
s2 = Startup.new('Table', 'Joe', 'table.com')

v1 = VentureCapitalist.new('Kelly' , 1000000001)
v2 = VentureCapitalist.new('Lee' , 10000)
v3 = VentureCapitalist.new('Dan' , 50000)

f0 = FundingRound.new(s1, v1, 'Series B', 100000000)
f1 = FundingRound.new(s1, v1, 'Series A', 22222)
f2 = FundingRound.new(s1, v2, 'Series B', 4444)
f3 = FundingRound.new(s2, v3, 'Seed', 555555)
f4 = FundingRound.new(s2, v2, 'Seed', 7777777)
f5 = FundingRound.new(s2, v1, 'Something', 88888)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line