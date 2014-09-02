class ChallengesController < ApplicationController
  before_action :authenticate_user!

  def show
    @challenge = Challenge.find params[:id]
    authorize(@challenge)
  end

  def new
    @challenge = Challenge.new
    authorize @challenge
  end

  def create
    @challenge = Challenge.new(challenge_params)
    authorize @challenge
    if @challenge.save
      redirect_to @challenge
    else
      render :new
    end
  end

  private
  def challenge_params
    params.require(:challenge).permit(:name, :starts_on, :description)
  end


end
