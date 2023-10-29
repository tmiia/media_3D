class AddResultsVisibleToDebates < ActiveRecord::Migration[7.0]
  def change
    add_column :debates, :results_visible, :boolean
  end
end
