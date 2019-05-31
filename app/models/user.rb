class User < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_many :books, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :omniauthable,
         omniauth_providers: %i(facebook twitter google_oauth2)

  validates :name, presence: true, length:{ maximum: 30}

  mount_uploader :icon, IconUploader

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        name:     auth.info.name,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end
end