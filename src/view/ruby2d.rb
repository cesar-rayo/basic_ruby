require 'ruby2d'

# Draw elements
module View
    class Ruby2dView
        
        def initialize
            @pixel_size = 50
        end

        def start(state)
            extend Ruby2D::DSL
            set(
                title: "Snake",
                width: @pixel_size * state.grid.columns,
                height: @pixel_size * state.grid.rows
            )
            show
        end

        def render(state)
            render_snake(state)
            render_food(state)
        end

        #Accessible from Ruby2dView only
        private

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