class ChefsController < ApplicationController
	def autocomplete_location
    render :json => ['location1', 'location2']
  end

  def index
  	# origin = LocationName::LOCATION[params[:location]]
   #  @locations = Location.within(5, :origin => origin).includes([chef: :menus]) 
    
    @location = Location.find_by_name(params[:location])
    session[:location] = @location
    params[:veg] ||= "true"
    params[:nonveg] ||= "true"
    params[:menu_type] ||="all"

   @menus = if params[:veg] == "true" and params[:nonveg] == "true"
              Menu.all
            elsif params[:veg] == "true"
              Menu.where(category: 'veg') 
            elsif params[:nonveg] =="true"
              Menu.where(category: 'non_veg') 
            else 
              []
            end
    @menus = @menus.select{|menu| menu.menu_type == params[:menu_type]} unless params[:menu_type] == 'all'
    respond_to do |format|
      format.js #{ render :json => @menues }
      format.html { }
    end
  end

  def show
    @chef = Chef.find(params[:id])
  end

  def aboutus
  end

  def contactus
  end

  def termscondition
  end

  def addcart
  	menu_id = params[:menu_id]
  	menu = Menu.find(menu_id)
  	@cart.add(menu, menu.price)
    render :partial => 'table'
  end

  def removecart
  	menu_id = params[:menu_id]
  	menu = Menu.find(menu_id)
  	@cart.remove(menu, 1)
  	render :partial => 'table'
  end

  def apply_coupon
  #coupon_code = params[:coupon_code]

  end
end
