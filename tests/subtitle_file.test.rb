# encoding : utf-8
require 'test/unit'
require '../subtitle_file'

class SubtitleFileTest < Test::Unit::TestCase

	def setup
		@input_file = "./data/input.srt"
	end

	def test_input_file_not_found
		assert_raise Errno::ENOENT do
			SubtitleFile.new("./bogus.srt")
		end
	end

	def test_file_found
		assert_nothing_raised do
			SubtitleFile.new(@input_file)
		end
	end

	def test_change_speed
		expected = File.open('./data/expected.srt').read
		input = SubtitleFile.new(@input_file).change_speed(23.946, 25)
		puts input
		assert_equal(expected, input, "expected.srt does not match changed speed")
	end


end

