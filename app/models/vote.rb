class Vote < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates_uniqueness_of :post_id, scope: :user_id
  validates_inclusion_of :value, in: [1, -1]
  #validate :ensure_not_author


  def ensure_not_author
  	errors.add :user_id, "is the creator of this post" if post.user_id = user_id
  end

end
