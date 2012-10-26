# encoding : utf-8
require 'test/unit'
require '../subtitle_timing'

class SubtitleTimingTests < Test::Unit::TestCase

	def test_initialize
		s =  SubtitleTiming.new(28572)
		assert_equal(28572, s.to_timestamp)
		assert_equal("00:00:28,572", s.to_timing)

		s = SubtitleTiming.new("00:00:28,572")
		assert_equal(28572, s.to_timestamp)
		assert_equal("00:00:28,572", s.to_timing)
	end

	def test_timing_to_timestamp
		assert_equal(572,    SubtitleTiming.new("00:00:00,572").to_timestamp)
		assert_equal(28572,  SubtitleTiming.new("00:00:28,572").to_timestamp)
		assert_equal(88572,  SubtitleTiming.new("00:01:28,572").to_timestamp)
		assert_equal(3688572,SubtitleTiming.new("01:01:28,572").to_timestamp)
	end

	def test_timestamp_to_timing
		assert_equal("00:00:00,572", SubtitleTiming.new(572).to_timing)
		assert_equal("00:00:28,572", SubtitleTiming.new(28572).to_timing)
		assert_equal("00:01:28,572", SubtitleTiming.new(88572).to_timing)
		assert_equal("01:01:28,572", SubtitleTiming.new(3688572).to_timing)
	end

	def test_change_speed
		assert_equal("00:00:27,401", SubtitleTiming.new("00:00:28,572").change_speed(23.976, 25))
	end

end
