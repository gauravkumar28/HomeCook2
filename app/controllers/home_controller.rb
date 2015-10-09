class HomeController < ApplicationController
  def index
  	@user = User.where(:id => params[:id]).includes(:orders).first
  end
end
