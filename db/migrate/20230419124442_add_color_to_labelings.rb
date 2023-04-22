class AddColorToLabelings < ActiveRecord::Migration[7.0]
  def change
    add_column :labelings, :color, :integer, null: false, default: 0
  end
end
