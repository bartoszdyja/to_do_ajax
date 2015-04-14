class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.boolean :done, default: false

      t.timestamps null: false
    end
  end
end
