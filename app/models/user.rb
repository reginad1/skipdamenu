class User < ApplicationRecord

	has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
  :omniauth_providers => [:facebook]



  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  		user.email = auth.info.email
  		#binding.pry
  		# user.picture_url = auth.extra.raw_info.picture
  	end
  end

end
