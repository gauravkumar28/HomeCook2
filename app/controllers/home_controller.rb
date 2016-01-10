class HomeController < ApplicationController
  def index
  	@user = User.where(:id => params[:id]).includes(:orders).first
  end

  def list
  	user = User.where(:id => params[:id]).includes(:orders).first
  	if user 
  		render status: 200, json: user.orders
    else
     	render status: 400, json: {error: "User not found"}
    end
  end
end
