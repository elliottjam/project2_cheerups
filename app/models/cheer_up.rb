class CheerUp < ActiveRecord::Base
  attr_accessible :content, :image_upload, :latitude, :longitude, :rating, :sound_upload, :user_id, :votes

  acts_as_votable

  belongs_to :user

  validates :content, presence: true

  scope :blurb, -> { select("content, image_upload, rating, sound_upload, user_id, votes") }

  scope :with_user, -> { includes(:user)}

  def vote_up
    @cheer_up.rating += 1
    @cheer_up.votes += 1
    @cheer_up.save
  end

  def vote_down
    @cheer_up.rating -= 1
    @cheer_up.votes += 1
    @cheer_up.save
  end


end
