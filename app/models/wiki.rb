class Wiki < ActiveRecord::Base

  has_many :relationships
  has_many :users, through: :relationships

  scope :creator_created, -> {where(relationships: {creator_created: true})}

  validates :title, presence: true
  validates :body, presence: true

  def personal?
    personal==true
  end

end
