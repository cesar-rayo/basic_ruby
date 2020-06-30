require 'minitest/autorun'
require './src/actions/actions'
require './src/model/state'

class ActionsTests < Minitest::Test
    def setup
        @initial_state = Model::State.new(
            Model::Snake.new([Model::Point.new(1,1),Model::Point.new(0,1)]),
            Model::Food.new(4,4),
            Model::Grid.new(8,12),
            Model::Direction::DOWN,
            false
        )
    end
    def test_move_snake
        expected_state = Model::State.new(
            Model::Snake.new([Model::Point.new(2,1),Model::Point.new(1,1)]),
            Model::Food.new(4,4),
            Model::Grid.new(8,12),
            Model::Direction::DOWN,
            false
        )

        actual_state = Actions::move_snake(@initial_state)
        assert_equal actual_state, expected_state
    end

    def test_change_direction_invalid
        expected_state = Model::State.new(
            Model::Snake.new([Model::Point.new(1,1),Model::Point.new(0,1)]),
            Model::Food.new(4,4),
            Model::Grid.new(8,12),
            Model::Direction::DOWN,
            false
        )

        actual_state = Actions::change_direction(@initial_state, Model::Direction::UP)
        assert_equal actual_state, expected_state
    end

    def test_change_direction_valid
        expected_state = Model::State.new(
            Model::Snake.new([Model::Point.new(1,1),Model::Point.new(0,1)]),
            Model::Food.new(4,4),
            Model::Grid.new(8,12),
            Model::Direction::LEFT,
            false
        )

        actual_state = Actions::change_direction(@initial_state, Model::Direction::LEFT)
        assert_equal actual_state, expected_state
    end
end