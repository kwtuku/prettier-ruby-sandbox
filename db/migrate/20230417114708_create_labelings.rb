class CreateLabelings < ActiveRecord::Migration[7.0]
  def change
    create_table :labelings, id: :uuid do |t|
      t.references :questionnaire,
                   null: false,
                   foreign_key: true,
                   type: :uuid,
                   index: false
      t.references :label, null: false, foreign_key: true, type: :uuid

      t.index %i[questionnaire_id label_id], unique: true
      t.timestamps
    end
  end
end
