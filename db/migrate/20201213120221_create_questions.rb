class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :questions, null: false
      t.references :level
      t.integer :point
      t.timestamps
    end
  end
end
