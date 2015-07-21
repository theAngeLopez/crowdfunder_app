class PledgesController < ApplicationController
  def new
    @pledge = Pledge.new
  end

  def create
    @pledge = Pledge.new(pledge_params)
      if @pledge.save
        redirect_to projects_path, notice: "Thanks for pledging!"
      else
        render "new"
      end
  end

  private
  params.require(:pledge).params(:amount, :user_id, :reward_id)
end
