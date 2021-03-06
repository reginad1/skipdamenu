class User < ApplicationRecord

	has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :omniauthable,
  :omniauth_providers => [:facebook, :google_oauth2]

 validates :email, uniqueness: {scope: :provider}

 geocoded_by :address
 after_validation :geocode, if: :address_changed?

 def address
  [city, zip].compact.join(", ")
 end

 def address_changed?
  city_changed? || zip_changed?
 end

 def self.from_omniauth(auth)
 	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
 		user.email = auth.info.email
 	end
 end

 def email_required?
 	super && provider.blank?
 end

 def password_required?
 	super && provider.blank?
 end



end
