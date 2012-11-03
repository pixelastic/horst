# encoding : utf-8
require_relative 'subtitle_line'

class SubtitleFile

	def initialize(input)
		raise Errno::ENOENT unless File.exists?(input)

		@content = File.open(input).read
	end

	def to_s
		@content
	end

	def change_speed(old_fps, new_fps)
		new_content = ''
		@content.each_line do |line|
			subline = SubtitleLine.new(line.chomp)

			# Change speed if a timing line
			subline.change_speed(old_fps, new_fps) if subline.timing_line?

			new_content+=subline.to_s+"\n"
		end
		return new_content
	end

end
