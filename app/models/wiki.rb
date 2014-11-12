class Wiki < ActiveRecord::Base

  has_many :relationships
  has_many :users, through: :relationships

  default_scope {order('created_at DESC')}

  validates :title, presence: true
  validates :body, presence: true

end
