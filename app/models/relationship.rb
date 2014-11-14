class Relationship < ActiveRecord::Base
  attr_reader :wiki_id, :user_id, :creator_created

  belongs_to :users
  belongs_to :wikis
end