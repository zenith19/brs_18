class AddPublisherToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :publisher, :string, limit: 255
  end
end
