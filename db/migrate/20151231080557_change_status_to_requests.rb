class ChangeStatusToRequests < ActiveRecord::Migration
  def change
    change_column_default :requests, :status, 0
  end
end
