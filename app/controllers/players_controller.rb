class PlayersController < ApplicationController
  def index
    @player = Player.all
  end

  def show

  end

  def new
      @player = Player.new
  end

  def create
      @player = Player.new(players_params)  
      if @player.save
          redirect_to root_path, notice: "Player saved"
      else
          render :new
      end
  end
  
  def delete

  end

  def edit
      
  end
   
  def players_params
      params.require(:player).permit(:first_name, :last_name, :position, :number)
  end
  
end
