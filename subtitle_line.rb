# encoding : utf-8
require_relative 'subtitle_timing'

class SubtitleLine

	def initialize(*params)
		@value = params[0]
	end

	def to_s
		@value
	end

	# Is this a timing line ?
	def timing_line?
		if @value =~ /\d{2}:\d{2}:\d{2},\d{3}\s-->\s\d{2}:\d{2}:\d{2},\d{3}/
			return true
		else
			return false
		end
	end

	# Set the line as a timing line 
	def timing_line(start, stop)
		@value = "#{start.to_timing} --> #{stop.to_timing}"
		return self
	end

	# Return the start and stop timers
	def timings
		return [] unless self.timing_line?
		a,b = @value.split(' --> ')
		return [SubtitleTiming.new(a), SubtitleTiming.new(b)]
	end

end
