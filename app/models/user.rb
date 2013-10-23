class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  ROLES = %w[admin user]
  has_many :posts
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :role, :password, :password_confirmation, :current_password
end
