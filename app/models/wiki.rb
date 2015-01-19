class Wiki < ActiveRecord::Base

  has_many :relationships
  has_many :users, through: :relationships
  
  default_scope { order('created_at DESC')}

  scope :created_by, -> {where(relationships: {creator_created: true})}

  validates :title, presence: true
  validates :body, presence: true

  def personal?
    personal==true
  end
  
  def creator
    r = relationships.find_by((:wiki_id == self.id) && (:creator_created == true))
    users.find_by(:id == r.user_id)
  end
  
end
