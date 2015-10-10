namespace :db do
  task :populate_data => :environment do
    require 'faker'
    require 'populator'
    Location_Name = ["FC Road", "SB Road", "JM Road", "Shivaji Nagar", "Wakewadi", "E-Square", "Kasbapeth", "COEP Hostels", "Deccan Gymkhana"]
    index = 1
    Time_Frame_Time = ['7AM - 8 AM', '8AM - 9AM', '10AM - 11AM','11AM - 12PM', '12PM - 1PM', '1PM - 2PM', '2PM - 3PM', '7 PM-8 PM', '8PM - 9PM', '9PM - 10PM']
    Location.populate 9 do |location|
      location.street = "street#{index}"
    	location.city = "city#{index}"
    	location.landmark = "landmark#{index}"
    	location.name =  Location_Name[index]
      time_frame_index = 0
      TimeFrame.populate 10 do |time_frame|
      	time_frame.location_id = location.id
        time_frame.time = Time_Frame_Time[time_frame_index]
        time_frame_index += 1
      end
      index += 1
    end

    index = 0
    Menu_Detail = [['veg briyani', 'rice', 'veg'], ['chicken briyani', 'rice', 'non-veg'], ['fried rice', 'rice', 'veg'], ['chicken fried rice', 'rice','non-veg'], ['aaloo paratha', 'paratha', 'veg'], ['gobhi paratha', 'paratha', 'veg'], ['paneer butter masala', 'gravy', 'veg'], ['paneer tikka', 'gravy', 'veg'], ['butter chicken', 'gravy', 'non-veg'], ['hyderabadi chicken', 'gravy', 'non-veg']]
    Menu.populate 10 do |menu|
      menu.name = Menu_Detail[index][0]
      menu.menu_type= Menu_Detail[index][1]
      menu.category = Menu_Detail[index][2]
      menu.price= 100
      index +=1
    end

    Coupan.populate 1 do |coupan|
      coupan.code = 'WELCOME'
      coupan.discount = 20
      coupan.discount_type = 'percent'
    end

    Coupan.populate 1 do |coupan|
      coupan.code = 'WELCOME50'
      coupan.discount = 50
      coupan.discount_type = 'absolute'
    end
  end
end