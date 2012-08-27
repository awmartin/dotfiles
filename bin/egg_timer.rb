#!/usr/bin/env ruby -wKU

minutes = ARGV.length > 0 ? ARGV[0].to_f : 30
seconds = (minutes * 60).to_i

image_path = "$DOCUMENTS_DIR/Graphics\\ Library/icons/onebit/PNG/onebit_36.png"

while true
  t = Time.now
  formatted_time = t.strftime("%l:%M %p").downcase
  
  puts
  puts "egg timer!"
  puts "It's now #{formatted_time}. Waiting for #{minutes} more minutes."
  puts
  
  `growlnotify -t 'Timer ping!' -m 'It is now #{formatted_time}.' --image #{image_path}`
  sleep seconds
end
