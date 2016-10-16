class Post < ActiveRecord::Base
  validates :description, :user_id, presence: true
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  acts_as_votable
end
