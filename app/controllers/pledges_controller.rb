class PledgesController < ApplicationController
  def show
  end

  def new
    @pledge = Pledge.new
  end

  def create
    @pledge = Pledge.new(pledge_params)
    @pledge.project_id = params[:project_id]
    @pledge.backer = current_user
      if @pledge.save
        redirect_back_or_to project_url(params[:project_id]), notice: "Successfully Pledged!"
      else
        redirect_to home
      end
  end

  def destroy
  end

  private
  def pledge_params
    params.require(:pledge).permit(:description, :amount, :backer_limit, :reward_id, :user_id)
  end
end
