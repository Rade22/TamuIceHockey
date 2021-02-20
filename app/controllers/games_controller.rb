class GamesController < ApplicationController
 
    def index
        @game = Game.all
    end
    
    def show
        @game = Game.find(params[:id])
    end

    def new
        @game = Game.new
    end

    def create
        @game = Game.new(games_params)  
        if @game.save
            redirect_to games_path, notice: "Game saved"
        else
            render :new
        end
    end
    
    def destroy
        @game = Game.find(params[:id])
        @game.destroy

        redirect_to games_path, :notice => "Your game has been deleted"
    end

    def edit
        @game = Game.find(params[:id])
    end
     
    def games_params
        params.require(:game).permit(:against_team, :date, :location)
    end
end