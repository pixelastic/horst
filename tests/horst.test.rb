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
		assert_equal(572, timing_to_timestamp("00:00:00,572"))
		assert_equal(28572, timing_to_timestamp("00:00:28,572"))
		assert_equal(88572, timing_to_timestamp("00:01:28,572"))
		assert_equal(3688572, timing_to_timestamp("01:01:28,572"))
	end

	def test_timestamp_to_timing
		assert_equal("00:00:00,572", timestamp_to_timing(572))
		assert_equal("00:00:28,572", timestamp_to_timing(28572))
		assert_equal("00:01:28,572", timestamp_to_timing(88572))
		assert_equal("01:01:28,572", timestamp_to_timing(3688572))
	end

	def test_change_speed
		input = "00:00:28,572"
		initial_speed = 23.976
		new_speed = 25
		expected = "00:00:27,401"
		assert_equal(expected, change_speed(input, initial_speed, new_speed))
	end
end
