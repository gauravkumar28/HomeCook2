class PartyOrdersController < ApplicationController
  
  respond_to :js, :html
  def new
    @party_order = PartyOrder.new
  end

  def create
    @party_order = PartyOrder.new(params[:party_order])

    if @party_order.save!
      flash[:success] = 'Party Order Placed!!!'
      render :js => "window.location = '#{root_path}'" and return
    else
      respond_to do |format|
        format.js { render :action => 'new' }
      end
    end
  end
end
