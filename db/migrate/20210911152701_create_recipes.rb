class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :cal_per_serv
      t.integer :yields
      t.integer :total_time
      t.string :comment

      t.timestamps
    end
  end
end
