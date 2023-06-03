class User < ApplicationRecord
  rolify
  acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :phones, as: :phoneable
  has_one :patient, dependent: :destroy

  after_save :user_mailer
  # def send_devise_notification(notification, *args)
  #  devise_mailer.send(notification, self, *args).deliver_later
  # end

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = provider_data.info.first_name
      user.last_name = provider_data.info.last_name
      user.image = provider_data.info.image
      user.skip_confirmation!
    end
  end

  def user_mailer
    UserMailer.welcome(@user).deliver_later
  end
end
