class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable,
  # :timeoutable, :trackable, :registerable, :recoverable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  validates_presence_of :name
  def self.blacklist_keys
    @blacklist_keys ||= super - ["id"]
  end
end
