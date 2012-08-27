#!/usr/bin/env ruby -wKU

path = ARGV.length > 0 ? ARGV[0] : "."

# indexed
all_children = Dir[File.join(path, "**/*")]
filenames = all_children.collect {|f| File.basename(f)}

puts "Number of files: #{all_children.length}"

module Enumerable
  def dups
    inject({}) {|h,v| h[v]=h[v].to_i+1; h}.reject{|k,v| v==1}.keys
  end
end


duplicates = filenames.dups


duplicates_full_path = []

all_children.each do |f|
  if duplicates.include?(File.basename(f))
    duplicates_full_path += [f]
  end
end

puts "Number of duplicates found: #{duplicates_full_path.length}"
puts

duplicates_full_path.sort! {|a,b| File.basename(a) <=> File.basename(b)}

this = duplicates_full_path[0]
duplicates_full_path.each do |d|
  if File.basename(this) != File.basename(d)
    puts
    this = d
  end
  puts d
end
