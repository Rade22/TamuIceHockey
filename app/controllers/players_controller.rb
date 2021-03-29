# frozen_string_literal: true

# controller for players model
class PlayersController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :delete, :destroy, :edit, :update]
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
      redirect_to players_path, notice: 'Player saved'
    else
      render :new
    end
  end

  def delete
    @player = Player.find(params[:id])
		rescue ActiveRecord::RecordNotFound
		redirect_to :action => 'index'
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
end
