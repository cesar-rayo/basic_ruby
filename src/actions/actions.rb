module Actions
    def self.move_snake(state)
        next_direction = state.current_direction
        next_point = calc_next_point(state)
        #check next move
        if position_is_valid?(state, next_point)
            move_snake_to(state, next_point)
        else
            end_game(state)
        end
    end

    def self.change_direction(state, direction)
        if next_direction_is_valid?(state, direction)
            state.current_direction = direction
        else
            puts "Invalid direction"
        end
        state
    end

    private

    def self.calc_next_point(state)
        current_position = state.snake.positions.first
        
        case state.current_direction
        when Model::Direction::UP
            #decrease row
            return Model::Point.new(
                current_position.row - 1,
                current_position.column,
            )

        when Model::Direction::RIGHT
            #increment column
            return Model::Point.new(
                current_position.row,
                current_position.column + 1,
            )
        when Model::Direction::LEFT
            #decrease column
            return Model::Point.new(
                current_position.row,
                current_position.column - 1,
            )
        when Model::Direction::DOWN
            #increment row
            return Model::Point.new(
                current_position.row + 1,
                current_position.column,
            )
        end
    end

    def self.position_is_valid?(state, point)
        #check grid contains point
        is_invalid = ((point.row >= state.grid.rows || point.row < 0) || 
            (point.column >= state.grid.columns || point.column < 0))
        return false if is_invalid

        #check point available
        return !(state.snake.positions.include? point)
    end

    def self.move_snake_to(state, point)
        #[head, tail]
        #[(1,1),(1,0)]
        new_positions = [point] + state.snake.positions[0...-1]
        #[(1,2),(1,1)] => (1,0) not included 
        state.snake.positions = new_positions
        return state
    end

    def self.end_game(state)
        puts "GAME OVER"
        state.game_finish = true
        return state
    end

    def self.next_direction_is_valid?(state,direction)
        case state.current_direction
        when Model::Direction::UP
            return true if direction != Model::Direction::DOWN
        when Model::Direction::DOWN
            return true if direction != Model::Direction::UP
        when Model::Direction::RIGHT
            return true if direction != Model::Direction::LEFT
        when Model::Direction::LEFT
            return true if direction != Model::Direction::RIGHT
        end
        return false
    end
end