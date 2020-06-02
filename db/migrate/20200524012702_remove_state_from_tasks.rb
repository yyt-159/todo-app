class RemoveStateFromTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :state, :text
  end
end
