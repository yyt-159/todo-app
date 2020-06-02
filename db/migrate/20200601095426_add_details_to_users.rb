class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :done_total, :integer
  end
end
