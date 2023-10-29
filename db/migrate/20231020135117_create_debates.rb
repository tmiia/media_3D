class CreateDebates < ActiveRecord::Migration[7.0]
  def change
    create_table :debates do |t|
      t.string :title
      t.text :lead
      t.text :context

      t.timestamps
    end
  end
end
