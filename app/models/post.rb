class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :songs
  accepts_nested_attributes_for :songs, :reject_if => lambda { |a| a[:source].blank?}
  attr_accessible :title, :text, :songs_attributes
  validates :title, presence: true,
                    length: {minimum: 5}
end
