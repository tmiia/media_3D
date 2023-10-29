class AddDebateToPoll < ActiveRecord::Migration[7.0]
  def change
    add_reference :polls, :debate, null: false, foreign_key: true
  end
end
