class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :body
      t.references :question, foreign_key: true
      t.string :comment
      t.string :right
      t.string :boolean

      t.timestamps
    end
  end
end
