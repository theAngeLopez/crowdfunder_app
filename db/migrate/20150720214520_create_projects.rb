class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :funding_goal
      t.datetime :start_date
      t.datetime :end_date
      t.string :category

      t.timestamps null: false
    end
  end
end
