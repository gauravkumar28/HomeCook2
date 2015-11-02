ActiveAdmin.register Order do
  filter :status
  filter :id
  filter :time
  filter :location
  filter :landmark
  filter :created_at
  filter :updated_at
  batch_action :mark_delivered do |ids|
    Order.find(ids).each do |order|
      order.update_attributes(:status => Order::STATUS::DELIVERED)
    end
    redirect_to collection_path, alert: "The Order has been delevered!!"
  end
end
