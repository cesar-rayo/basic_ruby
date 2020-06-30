# Game Representation

module Model
    module Direction
        UP = :up
        RIGHT = :right
        LEFT = :left
        DOWN = :down
    end
    class Point < Struct.new(:row,:column)
    end

    class Food < Point
    end

    class Snake < Struct.new(:positions)
    end

    class Grid < Struct.new(:rows,:columns)
    end

    class State < Struct.new(:snake, :food, :grid, :current_direction, :game_finish)
    end

    def self.initial_state
        Model::State.new(
            Model::Snake.new([Model::Point.new(1,1),Model::Point.new(0,1)]),
            Model::Food.new(4,4),
            Model::Grid.new(8,12),
            Model::Direction::DOWN,
            false
        )
    end
end