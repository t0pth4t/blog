class Post < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :user
  has_many :comments, dependent: :destroy
  attr_accessible :title, :text
  validates :title, presence: true,
                    length: {minimum: 5}
end
