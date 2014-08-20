class ChangeColumn < ActiveRecord::Migration
  def change
  	rename_column :replies, :topic_id, :forum_id
  end
end
