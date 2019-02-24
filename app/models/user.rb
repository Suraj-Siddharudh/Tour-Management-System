class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:google]

 validates_presence_of :email, :first_name
#  validates :password, length: { in: 6..20 }, confirmation: true

validates_format_of :phone_number,
:with => /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/,
:message => "- Phone numbers must be in xxx-xxx-xxxx format."
 has_many :tour

 def self.from_omniauth(auth)
  user = User.where(:provider => auth.provider, :uid => auth.uid ).first
  if user
    return user
  else
    registered_user = User.where(:email => auth.info.email).first
    if registered_user
      return registered_user
    else
      user = User.create!(
        provider: auth.provider,
        email: auth.info.email,
        uid: auth.uid ,
        first_name: auth.info.email.split('@')[0],
        is_agent: 0,
        is_customer: 1,
        password: Devise.friendly_token[0,20],
      )
    end
  end
end 
end

