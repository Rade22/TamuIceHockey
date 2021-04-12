# frozen_string_literal: true

# controller for players model
class PlayersController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create delete destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    @player = Player.all
    @participation = Participation.all
    @games_total = Participation.group(:player_id).count

    @skater_goals_total = {}
    @player.each do |player|
      @player_perform = Participation.where(player_id: player.id)
      @stat = @player_perform.sum(:goals_skater)
      @skater_goals_total[player.id] = @stat
    end

    @skater_goals_total = {}
    @player.each do |player|
      @player_perform = Participation.where(player_id: player.id)
      @stat = @player_perform.sum(:goals_skater)
      @skater_goals_total[player.id] = @stat
    end

    @skater_assists_total = {}
    @player.each do |player|
      @player_perform = Participation.where(player_id: player.id)
      @stat = @player_perform.sum(:assists_skater)
      @skater_assists_total[player.id] = @stat
    end

    @skater_assists_total = {}
    @player.each do |player|
      @player_perform = Participation.where(player_id: player.id)
      @stat = @player_perform.sum(:assists_skater)
      @skater_assists_total[player.id] = @stat
    end

    @skater_penalty_mins_total = {}
    @player.each do |player|
      @player_perform = Participation.where(player_id: player.id)
      @stat = @player_perform.sum(:penalty_minutes_skater)
      @skater_penalty_mins_total[player.id] = @stat
    end

    @skater_ppg_total = {}
    @player.each do |player|
      @player_perform = Participation.where(player_id: player.id)
      @stat = @player_perform.sum(:powerplay_goals_skater)
      @skater_ppg_total[player.id] = @stat
    end

    @goalie_goals_against_total = {}
    @player.each do |player|
      @player_perform = Participation.where(player_id: player.id)
      @stat = @player_perform.sum(:goals_against_goalie)
      @goalie_goals_against_total[player.id] = @stat
    end

    @goalie_time_on_ice_total = {}
    @player.each do |player|
      @player_perform = Participation.where(player_id: player.id)
      @stat = @player_perform.sum(:time_on_ice_goalie)
      @goalie_time_on_ice_total[player.id] = @stat
    end

    @goalie_saves_total = {}
    @player.each do |player|
      @player_perform = Participation.where(player_id: player.id)
      @stat = @player_perform.sum(:saves_goalie)
      @goalie_saves_total[player.id] = @stat
    end

    @goalie_shots_against_total = {}
    @player.each do |player|
      @player_perform = Participation.where(player_id: player.id)
      @stat = @player_perform.sum(:shots_against_goalie)
      @goalie_shots_against_total[player.id] = @stat
    end

    # @goalie_wins_total = {}
    # @player.each do |player|
    #   if player.position.eql?("Goalie")
    #     @player_perform = Participation.where(player_id: player.id)
    #     @player_perform.each do |perform|
    #       @game = perform.game_id
    #       @game_instance = Game.where(game_id: @game)
    #       @goals_for = @game_instance.goals_for
    #     end
    #   end
    # end


    
    
    
  end

  def show
    @player = Player.find(params[:id])
    @player_perform = Participation.where(player_id: params[:id])
    @game_info = Game.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(players_params)
    if @player.save
      @player.active = true
      redirect_to players_path, notice: 'Player saved'
    else
      render :new
    end
  end

  def delete
    @player = Player.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to action: 'index'
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

  def not_found
    redirect_to action: 'index'
  end

  def players_params
    params.require(:player).permit(:first_name, :last_name, :position, :number, :image_link, :active)
  end
end
