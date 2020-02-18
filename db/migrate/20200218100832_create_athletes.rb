class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :name 
      t.string :age 
      t.string :area 
      t.text :workout 

      t.timestamps null: false
    end 
  end
end
