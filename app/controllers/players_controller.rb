# frozen_string_literal: true

# controller for players model
class PlayersController < ApplicationController
  def index
    @player = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(players_params)
    if @player.save
      redirect_to root_path, notice: 'Player saved'
    else
      render :new
    end
  end

  def delete
    @player = Player.find(params[:id])
  end

  def destroy
    @player = Player.find(params[:id])
    @participation = Participation.where(player_id: @player.id)
    @participation.destroy_all
    @player.destroy
    flash.notice = 'Deleted Player Successfully'
    redirect_to players_path
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(players_params)
      flash[:update] = 'Player has been successfully updated!'
      redirect_to(player_path)
    else
      render 'edit'
    end
  end

  def players_params
    params.require(:player).permit(:first_name, :last_name, :position, :number)
  end

  # def full_name
  # "#{player.first_name} #{player.last_name}"
  # end
end
