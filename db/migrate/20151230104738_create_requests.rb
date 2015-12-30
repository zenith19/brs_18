class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.string :author
      t.string :link
      t.integer :status

      t.timestamps null: false
    end
  end
end
