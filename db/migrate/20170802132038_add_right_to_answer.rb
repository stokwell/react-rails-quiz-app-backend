class AddRightToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :right, :boolean, :default => true
  end
end
