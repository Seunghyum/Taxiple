class CreateUnivs < ActiveRecord::Migration
  def change
    create_table :univs do |t|
      t.string :uni_email
      t.boolean :campus, :default => false
      t.string :uni_name
      t.string :uni_route_1
      t.string :uni_route_2
      t.string :uni_route_3
      t.string :uni_route_4
      t.string :uni_route_5
      t.string :uni_route_6
      
      
      t.timestamps null: false
    end
  end
end
