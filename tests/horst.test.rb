# encoding : utf-8
require 'test/unit'
require '../horst'

class HorstTests < Test::Unit::TestCase

	def test_timing_line?
		assert_equal(false, timing_line?("1"))
		assert_equal(true, timing_line?("00:00:28,572 --> 00:00:33,237"))
		assert_equal(false, timing_line?("<i>Quand on prie la bonne étoile</i>"))
	end

	def test_split_timing_line
		input = "00:00:28,572 --> 00:00:33,237"
		expected = ["00:00:28,572", "00:00:33,237"]
		assert_equal(expected, split_timing_line(input))
	end

	def test_join_timing
		input = ["00:00:28,572", "00:00:33,237"]
		expected = "00:00:28,572 --> 00:00:33,237"
		assert_equal(expected, join_timing(input[0], input[1]))
	end

	def test_timing_to_timestamp
		input = "00:00:28,572"
		expected = 28572
		assert_equal(expected, timing_to_timestamp(input))
	end

	def test_timestamp_to_timing
		input = 28572
		expected = "00:00:28,572"
		assert_equal(expected, timestamp_to_timing(input))
	end

	def test_change_speed
		input = "00:00:28,572"
		initial_speed = 23.976
		new_speed = 25
		expected = "00:00:27,401"
		assert_equal(expected, change_speed(input, initial_speed, new_speed))
	end
end
