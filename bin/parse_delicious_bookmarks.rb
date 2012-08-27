#!/usr/bin/env ruby -wKU

filename = ARGV[0]

f = File.open(filename, "r+")
lines = f.readlines
f.close

current_category = ""

category_pattern = /tag=\"(.*?)\"/
href_pattern = /href=\"(.*?)\"/

target_dir = ARGV.length > 1 ? ARGV[1] : Dir.pwd

def titlecase(str)
  words = str.split(" ")
  words.collect{ |w| w.capitalize }.join(" ")
end

lines.each do |line|
  if line.include?("<post ")
    begin
      m = line.match(category_pattern)
      current_category = m[1].split(" ").first
    
      if current_category.nil?
        current_category = "Uncategorized"
      end
    rescue
      current_category = "Uncategorized"
    end
    
    begin
      n = line.match(href_pattern)
      url = n[1]
    
      dir_name = titlecase(current_category)
      path = File.join(target_dir, dir_name)
    
      if not File.exists?(path)
        Dir.mkdir(path)
      end
      Dir.chdir(path)
    
      puts "Found url #{url}. Creating bookmark in category '#{current_category}'"
      `bookmark #{url}`
      puts
      
    rescue
      puts "Couldn't make a bookmark for #{line.to_s[0..60]}"
      puts "but still continuing..."
      puts
    end
  end
end


