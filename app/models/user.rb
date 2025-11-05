class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, dependent: :destroy

  enum :role, {
    normal: 0,
    admin: 1,
  }, prefix: true
  
  before_validation :set_default_role, on: :create
  after_create :send_welcome_email

  def send_welcome_email
    SendWelcomeEmailJob.perform_later(self.id)
  end

  def set_default_role
    self.role ||= :normal
  end
end
