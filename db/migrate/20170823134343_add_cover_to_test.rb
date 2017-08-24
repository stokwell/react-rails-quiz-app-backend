class AddCoverToTest < ActiveRecord::Migration[5.0]
  def change
    add_column :tests, :cover, :string
  end
end
