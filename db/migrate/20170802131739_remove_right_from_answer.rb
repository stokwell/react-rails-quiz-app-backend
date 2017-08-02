class RemoveRightFromAnswer < ActiveRecord::Migration[5.0]
  def change
    remove_column :answers, :right, :boolean
  end
end
