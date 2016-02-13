class ChefsController < ApplicationController
	def autocomplete_location
    render :json => ['location1', 'location2']
  end

  respond_to :js, :html
  def index
    #flash[:notice] = "We are closed on 28th and 29th November. Sorry for inconvenience. You can book your orders from 30th Nov"
    @location = Location.find_by_id(params[:location].to_i)
    session[:location_id] = @location.id if @location.present?
    params[:veg] ||= "true"
    params[:nonveg] ||= "true"
    params[:menu_type] ||="all"
    redirect_to root_path if @location.nil?
   @menus = if params[:veg] == "true" and params[:nonveg] == "true"
              Menu.all
            elsif params[:veg] == "true"
              Menu.where(category: 'veg') 
            elsif params[:nonveg] =="true"
              Menu.where(category: 'non-veg') 
            else 
              []
            end
    
    @menus = @menus.select{|menu| menu.location_id.present?} if @location.id >= 14
    @menus = @menus.reject{|menu| menu.location_id.present?} if @location.id < 14
    @menus = @menus.select{|menu| menu.menu_type == params[:menu_type]} unless params[:menu_type] == 'all'

    respond_to do |format|
      format.js #{ render :json => @menues }
      format.html { }
    end
  end

  def show
    @chef = Chef.find(params[:id])
    unless @chef
      flash[:error] = 'Chef Not Found!!!'
      redirect_to :back
    end
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
    render :partial => 'table', locals:{show_button: true}
  end

  def removecart
    menu_id = params[:menu_id]
    menu = Menu.find(menu_id)
    @cart.remove(menu, 1)
    render :partial => 'table', locals:{show_button: true}
  end

  def apply_coupon
  end

  def comingsoon
    render :layout => false
  end


  def menu_list
    puts params if params['nonveg'] == "true"
    @location = Location.find_by_id(params['location_id'].to_i)
    render status:  400, json: {error: "location not found"} and return 
    session['location_id'] = @location.id if @location.present?
    params['veg'] ||= "true"
    params['nonveg'] ||= "true"
    params['menu_type'] ||="all"

   @menus = if params['veg'] == "true" and params['nonveg'] == "true"
              Menu.all
            elsif params['veg'] == "true"
              Menu.where(category: 'veg') 
            elsif params['nonveg'] =="true"
              Menu.where(category: 'non-veg') 
            else 
              []
            end
            @menus = @menus.select{|menu| menu.location_id.present?} if @location.id >= 14
    @menus = @menus.reject{|menu| menu.location_id.present?} if @location.id < 14
    @menus = @menus.select{|menu| menu.menu_type == params['menu_type']} unless params['menu_type'] == 'all'
    render status: 200, json: @menus
  end

  def add_to_cart
    menu_id = params['menu_id']
    menu = Menu.find(menu_id)
    @cart.add(menu, menu.price)

    render status: 200, json: @cart
  end


  def remove_from_cart
    menu_id = params['menu_id']
    menu = Menu.find(menu_id)
    @cart.add(menu, menu.price)

    render status: 200, json: @cart
  end
  

  def cart

    result =  {}
    @cart.cart_items.each do |cart_item|
      result[@cart.id] = {name: cart_item.item.name, quantity: cart_item.quantity, price: cart_item.quantity * cart_item.price}
    end
    render status: 200, json: result
  end
end
