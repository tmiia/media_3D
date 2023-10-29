class DropLikes < ActiveRecord::Migration[7.0]
  def change
    drop_table :likes, cascade: true, if_exists: true
  end
end
