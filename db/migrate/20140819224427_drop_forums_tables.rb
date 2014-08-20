class DropForumsTables < ActiveRecord::Migration
  def change
  	drop_table :forum_tables
  end
end
