# encoding : utf-8


# Is specified line a timing line ?
def timing_line?(line)
	if line =~ /\d{2}:\d{2}:\d{2},\d{3}\s-->\s\d{2}:\d{2}:\d{2},\d{3}/
		return true
	else
		return false
	end
end

# Returns an array of the start and end timings
def split_timing_line(timing)
	timing.split(' --> ')
end

# Joins to timings to create a timing line
def join_timing(a, b)
	"#{a} --> #{b}"
end

# Converts a timing to a timestamp in ms
def timing_to_timestamp(timing)
	split = timing.split(/:/)
	h = split[0].to_i
	m = split[1].to_i
	s = split[2]
	if s =~ /,/
		ssplit = s.split(',')
		s = ssplit[0]
		ms = ssplit[1].to_i
	end
	s = s.to_i

	return h*3600000 + m*60000 + s*1000 + ms
end

# Convert a timestamp in ms to a timing
def timestamp_to_timing(timestamp)
	h = "%02d" % (timestamp / 3600000 % 60)
	timestamp = timestamp % 3600000

	m = "%02d" % (timestamp / 60000 % 60)
	timestamp = timestamp % 60000

	s = "%02d" % (timestamp / 1000 % 60)
	timestamp = timestamp % 1000

	ms = "%03d" % (timestamp)
	return "#{h}:#{m}:#{s},#{ms}"
end

# Change a timing according to new fps
def change_speed(timing, old, new)
	ratio = old.to_f / new.to_f
	timestamp = timing_to_timestamp(timing)
	new_timestamp = timestamp * ratio
	return timestamp_to_timing(new_timestamp)
end
