class User < ApplicationRecord
  # Associations
  has_many :user_responses, dependent: :destroy
  has_many :messages
  before_destroy :destroy_connections

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def connections
    Connection.where("receiver_id = #{id} OR sender_id = #{id}")
  end

  private

  def destroy_connections
    connections.destroy_all
  end
end
