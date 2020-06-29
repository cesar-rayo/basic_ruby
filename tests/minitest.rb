#import custom class and minitest framework
require './src/libs/calculator.rb'
require 'minitest/autorun'

class TestCalculator < Minitest::Test
	def setup
		@calc = Calculators::BasicCalculator.new
	end
	def test_sum_positives
		result = @calc.addition(4,3)
		assert_equal(result, 7)
	end
	def test_sum_positives_fail
		result = @calc.addition(4,3)
		assert_equal(result, 8)
	end
end