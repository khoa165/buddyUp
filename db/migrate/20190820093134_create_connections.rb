class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.references :sender, foreign_key: {to_table: :users}
      t.references :receiver, foreign_key: {to_table: :users}
      t.string :status_receiver
      t.string :status_sender
      t.string :status

      t.timestamps
    end
  end
end
