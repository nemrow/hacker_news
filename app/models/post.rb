class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :votes

	def self.by_votes
		select('posts.*, coalesce(value, 0) as votes').
    joins('left join votes on post_id=posts.id').
    order('votes desc')
	end

	def add_or_update_vote(value, user)
		votes.find_or_create_by_user_id(value: value, user: user)
	end

end




