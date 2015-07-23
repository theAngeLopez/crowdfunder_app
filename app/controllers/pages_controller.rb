class PagesController < ApplicationController
  before_filter :require_login, :only => :secret

  def welcome
    render :homepage
  end

  def category
    @projects = Project.all
    render :category
  end


end
