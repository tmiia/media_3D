class DropCommentaries < ActiveRecord::Migration[7.0]
  def change
    drop_table :commentaries, cascade: true, if_exists: true
  end
end
