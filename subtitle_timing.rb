# encoding : utf-8

class SubtitleTiming

	# Accept a timing string or a timestamp for init
	def initialize(timing)
		if timing.instance_of?(String) && timing[':']
			@value = self.timing_to_timestamp(timing)
		else
			@value = timing.to_i
		end
	end

	def to_s
		to_timing
	end

	# Return the timing as a timestamp
	def to_timestamp
		@value
	end

	# Return the timing
	def to_timing
		self.timestamp_to_timing(@value)
	end

	# Convert a timestamp in ms to a timing
	def timestamp_to_timing(timestamp)
		h = "%02d" % (timestamp / 3600000)
		timestamp = timestamp % 3600000

		m = "%02d" % (timestamp / 60000)
		timestamp = timestamp % 60000

		s = "%02d" % (timestamp / 1000)
		timestamp = timestamp % 1000

		ms = "%03d" % (timestamp)
		return "#{h}:#{m}:#{s},#{ms}"
	end

	# Convert a timing to a timestamp
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
	
	# Change a timing according to new fps
	def change_speed(old_fps, new_fps)
		ratio = old_fps.to_f / new_fps.to_f
		@value = @value * ratio
		return self
	end
end

