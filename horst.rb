# encoding : utf-8
require_relative 'subtitle_file'

class Horst

	def initialize(*args)
		# Need correct number of args
		raise ArgumentError unless args.size == 3

		@file, @old_fps, @new_fps = args
		@file = File.expand_path(@file)
		@old_fps = @old_fps.to_f
		@new_fps = @new_fps.to_f

	end

	def change_speed
		puts SubtitleFile.new(@file).change_speed(@old_fps, @new_fps)
	end


end

Horst.new(*ARGV).change_speed

