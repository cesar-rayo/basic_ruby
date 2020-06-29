#import custom class and minitest framework
require './src/libs/calculator.rb'
require 'minitest/autorun'

#Minitest docs http://docs.seattlerb.org/minitest/

class TestCalculator < Minitest::Test
	#Execute befor any test
	def setup
		@calc = Calculators::BasicCalculator.new
	end

	#Tests defined by prefix test_
	def test_sum_positives
		result = @calc.addition(4,3)
		assert_equal(result, 7)
		#More assertions here http://docs.seattlerb.org/minitest/Minitest/Assertions.html
	end
	def test_sum_positives_fail
		result = @calc.addition(4,3)
		assert_equal(result, 8)
	end
	def test_sum_mixes
		result = @calc.addition(4,-3)
		assert_equal(result, 1)
	end
end