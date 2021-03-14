class PlayersController < ApplicationController
  def index
    @player = Player.all
    @game = Game.all
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
       @player = Player.find(params[:id])
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    flash.notice = "Delete Player Successfully"
    redirect_to players_path
  end 

  def edit
    @player = Player.find(params[:id])
  end

  def update
    if @player.update(playersedit_params)
      flash[:update] = "Player has been successfully updated!"
      redirect_to(player_path)
    else
      render 'edit'
    end
  end

  def playerInGame
    @player = Player.all
    @game = Game.all
    
  end

  
   
  def players_params
      params.require(:player).permit(:first_name, :last_name, :position, :number)
  end

  def playersedit_params
      params.require(:player).permit(:first_name, :last_name, :position, :number, :time_on_ice, :goals, :assists, :penalty_minutes, :powerplay_goals)
  end
  
end
