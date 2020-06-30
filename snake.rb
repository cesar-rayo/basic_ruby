require './src/view/ruby2d'
require './src/model/state'
require './src/actions/actions'
class Game
    def initialize
        @state = Model::initial_state
    end
    def start
        view = View::Ruby2dView.new

        Thread.new { init_timer(view) }
        view.start(@state)
    end

    def init_timer(view)
        while !@state.game_finish do
            @state = Actions::move_snake(@state)
            view.render(@state)
            sleep 0.5
        end
    end
end

snake = Game.new
snake.start