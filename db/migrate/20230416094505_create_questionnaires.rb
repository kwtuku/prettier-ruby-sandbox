class CreateQuestionnaires < ActiveRecord::Migration[7.0]
  def change
    create_table :questionnaires, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.string :title, null: false
      t.text :description, null: false, default: ""

      t.string :level, null: false
      t.integer :visibility, null: false

      t.boolean :agreed, null: false, default: false
      t.boolean :comfortable, null: false, default: true

      t.date :expire_on

      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
