# frozen_string_literal: true

# controller for games model
class GamesController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :delete, :destroy, :edit, :update]
  
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    @games = Game.where(date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @game = Game.all   
  end

  def show
    @game = Game.find(params[:id])
    
    if @game.is_overtime == true
      @overtime = "(Overtime)"
    end
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(games_params)
    if @game.save
      redirect_to games_path, notice: 'Game saved'
    else
      render :new
    end
  end

  def delete
    @game = Game.find(params[:id])
	
	
  end

  def destroy
    @game = Game.find(params[:id])
    @participation = Participation.where(game_id: @game.id)
    @participation.destroy_all
    @game.destroy
    flash.notice = 'Delete Game Successfully'
    redirect_to games_path, notice: 'Your game has been deleted'
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(gamesedit_params)
      flash[:update] = 'Your game has been successfully updated!'
      redirect_to(game_path)
    else
      render 'edit'
    end
  end
  
  def not_found
	redirect_to :action => "index"
  end

  def games_params
    params.require(:game).permit(:against_team, :date, :time, :city, :ring_name, :state)
  end

  def gamesedit_params
    params.require(:game).permit(:against_team, :date, :time, :city, :ring_name, :state, :goals_for, :goals_against, :is_overtime, :powerplay_attemps, :killed_penalties, :total_penalties)
  end
end
