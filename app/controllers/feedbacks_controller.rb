class FeedbacksController < ApplicationController
  
  respond_to :js, :html
  def new
    @feedback = Feedback.new
  end

  def create
  	@feedback = Feedback.new(params[:feedback])
  	if @feedback.save!
  		flash[:success] = 'Feedback added successfully!!!'
  		render :js => "window.location = '#{root_path}'" and return
    else
    	respond_to do |format|
			  format.js { render :action => 'new' }
			end
    end
  end

end
