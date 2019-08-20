class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :description
      t.boolean :is_required, default: false

      t.timestamps
    end
  end
end
