class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.references :category, index: true, foreign_key: true
      t.string :title
      t.string :author
      t.date :publish_date
      t.integer :page
      t.integer :rating

      t.timestamps null: false
    end
  end
end
