class Comment < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :post
  attr_accessible :body, :commenter
end
