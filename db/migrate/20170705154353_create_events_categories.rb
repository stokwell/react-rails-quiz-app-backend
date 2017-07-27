class CreateEventsCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :events_categories, id: false do |t|
      t.references :event
      t.references :category
    end
  end
end
