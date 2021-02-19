class GamesController < ApplicationController
 
    def index
        @game = Game.all
    end
    
    def show

    end

    def new
        @game = Game.new
    end

    def create
        @game = Game.new(games_params)  
        if @game.save
            redirect_to root_path, notice: "Game saved"
        else
            render :new
        end
    end
    
    def delete

    end

    def edit
        
    end
     
    def games_params
        params.require(:game).permit(:against_team, :date, :location)
    end
end