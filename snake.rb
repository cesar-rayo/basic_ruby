require './src/view/ruby2d'
require './src/model/state'
require './src/actions/actions'
class Game
    def initialize
        @state = Model::initial_state
    end
    def start
        @view = View::Ruby2dView.new(self)

        Thread.new { init_timer(@view) }
        @view.start(@state)
    end

    def init_timer(view)
        while !@state.game_finish do
            @state = Actions::move_snake(@state)
            @view.render(@state)
            sleep 0.5
        end
    end

    def send_action(action, params)
        # invoque method "action"
        new_state = Actions.send(action, @state, params)
        # check if state changed to avoid unnecessary render
        if new_state.hash != @state.hash
            @state = new_state
            @view.render(@state)
        end
    end

    def end_game
        @state = Actions::end_game(@state)
        @view.render(@state)
    end
end

snake = Game.new
snake.start