class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :relationships
  has_many :wikis, through: :relationships

  def creator?(wiki, user)
    if Relationship.exists?(:wiki_id =>wiki.id, :user_id => user.id)
      relationships.find_by(wiki_id: wiki.id, user_id: user.id).creator_created
    else
      false
    end
  end

  def collaborator?(wiki, user)
    if Relationship.exists?(:wiki_id =>wiki.id, :user_id => user.id)
      true
    else
      false
    end
  end

  def admin?
    role == 'admin'
  end

  def standard?
    role == 'standard'
  end

  def premium?
    role == 'premium'
  end

end
