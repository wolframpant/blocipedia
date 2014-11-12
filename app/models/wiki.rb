class Wiki < ActiveRecord::Base
  has_many :users, through: :relationships
end
