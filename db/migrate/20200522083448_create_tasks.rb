class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.text :state 
      t.text :task
      t.date :limit_date
      t.timestamps
    end
  end
end
