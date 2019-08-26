class Connection < ApplicationRecord
  # Associations
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  has_many :meetings, dependent: :destroy
  has_many :messages, dependent: :destroy

  def self.exist?(person1, person2)
    c12 = Connection.where("sender_id = #{person1.id} AND receiver_id = #{person2.id}")
    c21 = Connection.where("sender_id = #{person2.id} AND receiver_id = #{person1.id}")
    c12.size == 1 || c21.size == 1
  end
end
