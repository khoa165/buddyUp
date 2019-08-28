class Connection < ApplicationRecord
  # Associations
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  has_many :meetings, dependent: :destroy
  has_many :messages, dependent: :destroy

  def self.connection_of(person1, person2)
    c12 = Connection.where("sender_id = #{person1.id} AND receiver_id = #{person2.id}")
    c21 = Connection.where("sender_id = #{person2.id} AND receiver_id = #{person1.id}")
    if c12.size == 1
      return c12[0]
    elsif c21.size == 1
      return c21[0]
    end
  end
end
