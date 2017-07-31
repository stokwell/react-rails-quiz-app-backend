class AddDefaultValueToAnswers < ActiveRecord::Migration[5.0]
  def up
  change_column :answers, :right, :boolean, default: false
end

def down
  change_column :answers, :right, :boolean, default: nil
end
end
