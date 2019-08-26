class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.string :location
      t.date :date
      t.string :category
      t.string :activities
      t.text :notes
      t.float :latitude
      t.float :longitude
      t.references :connection, foreign_key: true

      t.timestamps
    end
  end
end
