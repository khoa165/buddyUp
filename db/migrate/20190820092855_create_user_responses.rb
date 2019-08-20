class CreateUserResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_responses do |t|
      t.references :response, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
