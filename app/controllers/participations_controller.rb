# frozen_string_literal: true

# controller for participation controller
class ParticipationsController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create delete destroy edit update]
  def index
    @participation = Participation.all
  end

  def show
    @participation = Participation.find(params[:id])
    @player = Player.find(@participation.player_id)
    @game = Game.find(@participation.game_id)
  end

  def new
    if params[:id].present? && params[:player_id].present?
      @checkparticipation = Participation.find_by(player_id: params[:player_id], game_id: params[:id])
      if params[:id].present? && params[:player_id].present? && !@checkparticipation.nil?
        redirect_to action: 'edit', id: @checkparticipation.id
      end
    end
    @participation = Participation.new
    # if params.arity == 2
    @participation.game_id = params[:id].to_i
    @participation.player_id = params[:player_id].to_i
    #puts "IDs:"
    #puts params[:id]
    #puts params[:player_id]
    #puts @participation.to_json
    @player = (Player.find(params[:player_id]) if params[:player_id].present?)
    @game = Game.find(@participation.game_id) 
    # end
  end

  def games
    params.require(:id)
    @game = Game.all
  end

  def create
    #puts "before post"
    @participation = Participation.new(participations_params)
    #puts @participation.to_json
    #puts "after post"
    #puts params[:id]
    #puts params[:player_id]
    if @participation.save
      #puts @participation
	  flash[:success] = 'Statistics Saved!'
      #puts "created participation with id:"
      #puts @participation.player_id
      redirect_to playerParticipations_participation_path(Player.find(@participation.player_id))
    else
      #puts "hit else"
      render :new
    end
  end

  def delete
    @participation = Participation.find(params[:id])
    @player = Player.find(@participation.player_id)
    @game = Game.find(@participation.game_id)
  end

  def destroy
    @participation = Participation.find(params[:id])
    @participation.destroy
    flash[:success] = 'Statistics Deleted Successfully'
    redirect_to players_path
  end

  def edit
    @participation = Participation.find(params[:id])
    @player = Player.find(@participation.player_id)
    @game = Game.find(@participation.game_id)
  end

  def update
    @participation = Participation.find(params[:id])
    if @participation.update(participations_params)
      flash[:success] = 'Statitistics have been successfully updated!'
      redirect_to playerParticipations_participation_path(Player.find(@participation.player_id))
    else
      render 'edit'
    end
  end

  def playerParticipations
    @player = Player.find(params[:id])
    @participation = Participation.where(player_id: @player.id)
  end

  def participations_params
    params.require(:participation).permit(:player_id, :game_id, :time_on_ice_goalie,
                                          :shots_against_goalie, :saves_goalie, :goals_against_goalie,
                                          :goals_skater, :assists_skater, :penalty_minutes_skater,
                                          :powerplay_minutes_skater, :powerplay_goals_skater)
  end
end
