# encoding : utf-8
require 'test/unit'
require '../subtitle_line'

class SubtitleLineTests < Test::Unit::TestCase

	def test_timing_line?
		assert_equal(false,  SubtitleLine.new("1").timing_line?)
		assert_equal(false,  SubtitleLine.new("<i>Quand on prie la bonne étoile</i>").timing_line?)
		assert_equal(true,   SubtitleLine.new("00:00:28,572 --> 00:00:33,237").timing_line?)
	end

	def test_timing_line
		start = SubtitleTiming.new("00:00:28,572")
		stop = SubtitleTiming.new("00:00:33,237")
		expected = SubtitleLine.new("00:00:28,572 --> 00:00:33,237")
		input = SubtitleLine.new.timing_line(start, stop)

		assert_equal(expected.to_s, input.to_s)
	end

	def test_timings
		timings = SubtitleLine.new("00:00:28,572 --> 00:00:33,237").timings
		assert_equal("00:00:28,572", timings[0].to_s)
		assert_equal("00:00:33,237", timings[1].to_s)

		timings = SubtitleLine.new("Hello world!").timings
		assert_equal([], timings)
	end

end
