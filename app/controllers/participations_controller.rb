class ParticipationsController < ApplicationController
  def index
    @participation = Participation.all
  end

  def show
      @participation = Participation.find(params[:id])
  end

  def new
      @participation = Participation.new
  end

  def create
      @participation = Participation.new(participations_params)  
      if @participation.save
          redirect_to root_path, notice: "Participation saved"
      else
          render :new
      end
  end
  
  def delete
       @participation = Participation.find(params[:id])
       destroy
  end

  def destroy
    @participation = Participation.find(params[:id])
    @participation.destroy
    flash.notice = "Delete Participation Successfully"
    redirect_to participations_path
  end 

  def edit
    @participation = Participation.find(params[:id])
  end

  def update
    @participation = Participation.find(params[:id])
    if @participation.update(participations_params)
      flash[:update] = "Participation has been successfully updated!"
      redirect_to(participation_path)
    else
      render 'edit'
    end
  end
   
  def participations_params
      params.require(:participation).permit(:player_id, :game_id, :goals, :assists, :penalty_minutes, :powerplay_goals, :time_on_ice)
  end
end
