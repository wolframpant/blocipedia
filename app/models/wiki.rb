class Wiki < ActiveRecord::Base

  has_many :relationships
  has_many :users, through: :relationships
  has_many :images
  
  default_scope { order('created_at DESC')}

  scope :created_by, -> {where(relationships: {creator_created: true})}

  validates :title, presence: true
  validates :body, presence: true

  def personal?
    personal==true
  end
  
  def creator
    self.relationships.find_by(creator_created:true).user
  end
  
  def collaborator
    self.relationships.find_by(creator_created:false).user
  end
  
end
