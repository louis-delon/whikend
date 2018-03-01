class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :trips
  has_many :submissions
  has_many :messages
  has_many :reviews, foreign_key: "sender_id"
  has_many :reviews, foreign_key: "receiver_id", dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
  after_create :send_welcome_email

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
