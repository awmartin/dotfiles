#!/usr/bin/env ruby -wKU

if ARGV.length == 0
  puts "Extract text from any html file."
  puts
  puts "Usage: extract_text.rb [html file]"
  puts
  exit
end

f = File.open(ARGV[0], "r")
lines = f.readlines
f.close

original_text = lines.join
text = original_text.dup.gsub("\t", "").gsub("\n", " ")

content_tags = %w(form /form div table ul li ol body html head a h1 h2 h3 h4 h5 h6 label p span strong em b i title)

# TODO: get any meaningful attributes as well, like alt="" text from images.

content_tags.each do |tag|
  start_pattern = /<#{tag}\b[^>]*>/
  end_pattern = /<\/#{tag}>/
  
  if text.match(start_pattern)
    text.gsub!(start_pattern, "")
  end
  if text.match(end_pattern)
    text.gsub!(end_pattern, "")
  end
end

single_tags_to_delete = %w(img meta link !DOCTYPE br input)

single_tags_to_delete.each do |tag|
  pattern = /<#{tag}\b[^>]*>/
  
  if text.match(pattern)
    text.gsub!(pattern, "")
  end
end

paired_tags_to_delete = %w(script style)

# .*? = as few as possible

paired_tags_to_delete.each do |tag|
  pattern = /<#{tag}\b[^>]*>.*?<\/#{tag}>/
  
  if text.match(pattern)
    text.gsub!(pattern, "")
  end
end

puts text.gsub(/\s+/, " ").gsub("&nbsp;", " ").gsub("<!--", "").gsub("-->", "").gsub("<", "").gsub(">", "").strip

