class Song < ActiveRecord::Base
  belongs_to :post
  attr_accessible :artist, :description, :source, :title
end
