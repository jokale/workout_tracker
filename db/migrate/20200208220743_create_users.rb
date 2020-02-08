class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :area 
      t.text :workout 

      t.timestamps 

    end 
  end
end
