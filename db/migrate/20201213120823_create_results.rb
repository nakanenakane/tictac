class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.integer :score,               null: false
      t.references :level,            null: false
      t.references :user,             null: false
      t.timestamps
    end
  end
end
