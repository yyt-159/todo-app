class AddDetailsToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :public, :boolean, null: false
  end
end
