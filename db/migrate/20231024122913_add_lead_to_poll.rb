class AddLeadToPoll < ActiveRecord::Migration[7.0]
  def change
    add_column :polls, :lead, :text
  end
end
