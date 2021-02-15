<<<<<<< Updated upstream
class PlayersController < ApplicationController
  def index
  end
=======
module::Api
  class PlayersController < ApplicationController
    def index
      @players = Player.all
      render json: @players
    end

    def show
      @players = Player.find(params[:id])
      render json: @players
    end

    def create
      @players = Player.new(players_params)

      if @players.save
        render json: @players, status: :created
      else
        render json: @players.errors, status: :unprocessable_entity
      end
    end

    def update
      @players = Player.find(params[:id])
      if @players.update(players_params)
        render json: @players
      else
        render json: @players.errors, status: :unprocessable_entity
      end
    end
    
    def destroy
      @players = Player.find(params[:id])
      @players.destroyend
    end

      #####################################
    private

    def players_params
      params
        .require(:player)
    end


>>>>>>> Stashed changes
end
