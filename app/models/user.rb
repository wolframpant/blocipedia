class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :relationships
  has_many :wikis, through: :relationships

  def creator?(wiki, user)
    user.relationships.find_by(wiki_id: wiki.id).creator_created
  end

end
