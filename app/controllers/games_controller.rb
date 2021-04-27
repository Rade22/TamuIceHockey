# frozen_string_literal: true

# controller for games model
class GamesController < ApplicationController
  before_action :authenticate_admin!, :set_time_zone, only: %i[new create delete destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def set_time_zone
    Time.zone = 'Central Time (US & Canada)'
  end

  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    @games = Game.where(date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @game = Game.all
    @game_graph = Game.order(:date)

    @game_type = []
    @games.each do |game|
      if game.goals_for && game.goals_against && (game.goals_for > game.goals_against)
        @calendar_color = 'won-game'
      elsif game.goals_for && game.goals_against && (game.goals_against > game.goals_for)
        @calendar_color = 'lost-game'
      elsif game.scrimmage == true
        @calendar_color = 'scrimmage-game'
      elsif game.scrimmage == false
        @calendar_color = 'season-game'
      end
      @game_type.append(@calendar_color)
    end
  end

  def show
    @game = Game.find(params[:id])

    @overtime = '(Overtime)' if @game.is_overtime == true

    @scrimmage_game = '(Scrimmage)' if @game.scrimmage == true

    if @game.powerplay_goals && (@game.powerplay_attemps != 0 && @game.powerplay_attemps)
      @powerplay_percentage = ((@game.powerplay_goals.to_f / @game.powerplay_attemps) * 100).round(2)
    end

    if @game.killed_penalties && (@game.total_penalties != 0 && @game.total_penalties)
      @kill_percentage = ((@game.killed_penalties.to_f / @game.total_penalties) * 100).round(2)
    end
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(games_params)
    if @game.save
	  flash[:success] = 'Game Saved'
      redirect_to games_path
    else
      render :new
    end
  end

  def delete
    @game = Game.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to action: 'index'
  end

  def destroy
    @game = Game.find(params[:id])
    @participation = Participation.where(game_id: @game.id)
    @participation.destroy_all
    @game.destroy
	flash[:success] = 'Game Deleted Successfully!'
    redirect_to games_path
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(gamesedit_params)
      flash[:success] = 'Your game has been successfully updated!'
      redirect_to(game_path)
    else
      render 'edit'
    end
  end

  def not_found
    redirect_to action: 'index'
  end

  def games_params
    params.require(:game).permit(:against_team, :date, :time, :city, :ring_name, :state, :scrimmage)
  end

  def gamesedit_params
    params.require(:game).permit(:against_team, :date, :time, :city,
                                 :ring_name, :state, :goals_for, :goals_against,
                                 :is_overtime, :powerplay_attemps, :killed_penalties,
                                 :total_penalties, :scrimmage, :powerplay_goals)
  end
end
