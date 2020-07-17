require 'ruby2d'
require_relative "../model/state"
# Draw elements
module View
    class Ruby2dView
        
        def initialize(app)
            @pixel_size = 50
            @app = app
        end

        def start(state)
            extend Ruby2D::DSL
            set(
                title: "Snake",
                width: @pixel_size * state.grid.columns,
                height: @pixel_size * state.grid.rows
            )
            #read input
            on :key_down do |event|
                handle_key_event(event)
            end
            show
        end

        def render(state)
            extend Ruby2D::DSL
            close if state.game_finish
            render_food(state)
            render_snake(state)
        end

        #Accessible from Ruby2dView only
        private

        def handle_key_event(event)
            case event.key
            when "up"
                # goes up
                @app.send_action(:change_direction, Model::Direction::UP)
            when "down"
                # goes down
                @app.send_action(:change_direction, Model::Direction::DOWN)
            when "left"
                # goes left
                @app.send_action(:change_direction, Model::Direction::LEFT)
            when "right"
                # goes right
                @app.send_action(:change_direction, Model::Direction::RIGHT)
            when "escape"
                @app.end_game
            end
        end

        def render_food(state)
            @food.remove if @food #removes element if not nil
            extend Ruby2D::DSL
            @food = Square.new(
                x: state.food.column * @pixel_size,
                y: state.food.row * @pixel_size,
                size: @pixel_size,
                color: 'yellow',
            )
        end

        def render_snake(state)
#            if @snake_positions
#                @snake_positions.each do |pos|
#                    pos.remove
#                end
#            end
            @snake_positions.each(&:remove) if @snake_positions

            extend Ruby2D::DSL
            @snake_positions = state.snake.positions.map do |pos|
                Square.new(
                    x: pos.column * @pixel_size,
                    y: pos.row * @pixel_size,
                    size: @pixel_size,
                    color: 'green',
                )
            end
        end
    end
end