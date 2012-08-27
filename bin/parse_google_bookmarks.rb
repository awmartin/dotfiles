#!/usr/bin/env ruby -wKU

filename = ARGV[0]

f = File.open(filename, "r+")
lines = f.readlines
f.close

current_category = ""

category_pattern = /<H3[^>]*>(.*?)<\/H3>/
href_pattern = /HREF=\"(.*?)\"/

target_dir = ARGV.length > 1 ? ARGV[1] : Dir.pwd

def titlecase(str)
  words = str.split(" ")
  words.collect{ |w| w.capitalize }.join(" ")
end

lines.each do |line|
  if line.include?("H3")
    m = line.match(category_pattern)
    current_category = m[1]
    puts "Found category '#{current_category}'. Creating directory."
    
    dir_name = titlecase(current_category)
    path = File.join(target_dir, dir_name)
    
    if not File.exists?(path)
      Dir.mkdir(path)
    end
    Dir.chdir(path)
  end
  
  if line.include?("<A")
    # Get the URL only
    # Use 'bookmark' to create the bookmark
    m = line.match(href_pattern)
    url = m[1]
    puts "  Found URL #{url}. Creating bookmark."
    `bookmark #{url}`
  end
end


