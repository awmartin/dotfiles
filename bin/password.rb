#!/usr/bin/env ruby -wKU

# Sets
all = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789./-=+~!@#$_%^&"
hex = "0123456789abcdef"

# Pick a set
s = all
num = 128

r = ""
num.times do
  r += s[rand(s.length)].chr
end
puts r


