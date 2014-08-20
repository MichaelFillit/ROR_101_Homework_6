class RenameOldTableToNewTable < ActiveRecord::Migration
  def change
  	rename_table :forums_tables, :forums
  end
end
