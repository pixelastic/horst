# encoding : utf-8
require 'test/unit'
require '../horst'

class HorstTest < Test::Unit::TestCase

	def setup
		@input = "./data/input.srt"
		@old_fps = 23.976
		@new_fps = 25
	end

	def test_wrong_number_of_args
			assert_raise ArgumentError, "No args" do 
				Horst.new()
			end
			assert_raise ArgumentError, "Only one arg" do 
				Horst.new(@input)
			end
			assert_raise ArgumentError, "Only two args" do 
				Horst.new(@input)
			end
			assert_raise ArgumentError, "Too many args" do 
				Horst.new(@input, @old_fps, @new_fps, "rubbish")
			end
	end

	def test_input_file_not_found
		assert_raise Errno::ENOENT do
			Horst.new("./bogus.srt", @old_fps, @new_fps)
		end
	end

end
