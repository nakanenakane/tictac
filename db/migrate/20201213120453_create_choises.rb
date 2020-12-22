class CreateChoises < ActiveRecord::Migration[6.0]
  def change
    create_table :choises do |t|
      t.text :content,               null: false
      t.string :is_answer,           null: false
      t.references :question,        null: false
      t.timestamps
    end
  end
end