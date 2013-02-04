# encoding : utf-8
require 'test/unit'
require_relative '../subtitle_file'

class SubtitleFileTest < Test::Unit::TestCase

	def setup
		dirname = File.dirname(__FILE__)
		@datadir = File.join(dirname, 'data')
		@input_file = File.join(@datadir, "input.srt")
		@bogus_file = File.join(@datadir, 'bogus.srt')
		@expected_file = File.join(@datadir, 'expected.srt')
	end

	def test_input_file_not_found
		assert_raise Errno::ENOENT do
			SubtitleFile.new(@bogus_file)
		end
	end

	def test_file_found
		assert_nothing_raised do
			SubtitleFile.new(@input_file)
		end
	end

	def test_change_speed
		expected = File.open(@expected_file).read
		input = SubtitleFile.new(@input_file).change_speed(23.946, 25)
		assert_equal(expected, input, "expected.srt does not match changed speed")
	end


end

