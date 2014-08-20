class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
    	t.string :forum
      	t.integer :board_id

      	t.timestamps
    end
  end
end
