class CreateForumTables < ActiveRecord::Migration
  def change
    create_table :forums_tables do |t|
    	t.string :forum
      	t.integer :board_id

      	t.timestamps
    end
  end
end
