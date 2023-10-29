class AddConsecutiveDaysToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :consecutive_days, :integer
  end
end
