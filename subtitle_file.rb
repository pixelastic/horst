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
			line = SubtitleLine.new(line)

			# Keep as-is not a timing line
			unless line.timing_line?
				new_content+=line.to_s
				next
			end

			# TODO : Change speed of line, implement it in subtitle_line
		end
		return new_content

	end

end
