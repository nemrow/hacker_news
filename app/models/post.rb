class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :votes

	def self.by_votes
		 joins('left join votes on votes.post_id = posts.id').
		 select('posts.*, sum(votes.value) as vote_total').
		 group('posts.id').
		 order('vote_total DESC')
	end

	def add_or_update_vote(value, current_user)
		votes.where(user_id: current_user.id).first_or_create(value: value)
	end

end




