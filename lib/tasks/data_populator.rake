namespace :db do
  task :populate_data => :environment do
    require 'faker'
    require 'populator'
    index = 1
    Chef.populate 2 do |chef|
      chef.name = Faker::Name.name
      Location.populate 1 do |location|
      	location.street = "street#{index}"
      	location.city = "city#{index}"
      	location.country = "country#{index}"
      	location.lng = 1
      	location.lat = 1
      	location.chef_id = chef.id
      end
      Menu.populate 1 do |menu|
      	menu.name = "menu#{index}"
      	menu.price = 100
      	menu.chef_id = chef.id
      end
      index += 1
    end
  end
end