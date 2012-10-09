#!/usr/bin/env ruby
# encoding : utf-8

# horst : change srt fps

# Invalid number of args
unless ARGV.length == 3
	puts "Usage :"
	puts "horst subtitle.srt 23.976 25"
	exit
end

file = ARGV[0]
source = ARGV[1].to_f
dest = ARGV[2].to_f
ratio = source / dest
regex = /\d\d:\d\d:\d\d,\d\d\d\s-->\s\d\d:\d\d:\d\d,\d\d\d/

# Common errors
unless File.extname(file) == '.srt'
	puts 'horst only process .srt files'
	exit
end
unless File.exists?(file)
	puts "Unable to find #{file}"
	exit
end

def change_fps(time, ratio)
  # 01:18:51,340
	split = time.split(/:/)
	h = split[0].to_f
	m = split[1].to_f
	s = split[2]
	if s =~ /,/
		s = s.sub(/,/, ".")
	end
	s = s.to_f

	timestamp = (h*3600 + m*60 + s) * ratio

	h = "%02d" % (timestamp / 3600 % 60)
	m = "%02d" % (timestamp / 60 % 60)
	s = "%06.3f" % (timestamp % 60)

	new_time = "#{h}:#{m}:#{s}".gsub(/\./, ",")

	return new_time
end

lines = File.open(file).readlines
lines.each do |line|
	next unless line =~ regex
	split = line.split(' --> ')
	line.replace(change_fps(split[0], ratio) + ' --> ' + change_fps(split[1], ratio))
end


bak = File.expand_path(file) + '.bak'
File.rename(file, bak)
File.open(file, 'w') do |f|
  f.puts(lines)
  puts "Fps changed."
end

