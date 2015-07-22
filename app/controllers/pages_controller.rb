class PagesController < ApplicationController
  before_filter :require_login, :only => :secret

  def welcome
    render :homepage
  end
end
