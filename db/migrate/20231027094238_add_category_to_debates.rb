class AddCategoryToDebates < ActiveRecord::Migration[7.0]
  def change
    add_reference :debates, :category, null: false, foreign_key: true
  end
end
