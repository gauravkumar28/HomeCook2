ActiveAdmin.register Menu do
  form do |f|
    f.inputs "Menu Details" do
      f.input :name
      f.input :price
      f.input :category
      f.input :location_id
      f.input :menu_type
    end
    f.actions
  end

end
