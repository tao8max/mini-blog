class User < ActiveRecord::Base
	has_many :posts
	has_many :comments

    validates :username, presence: true
    before_validation :normalize_username, on: :create

	validates :email, presence: true, uniqueness: true, format: {with: /@/}
	validates :password, presence: true, confirmation: true, length: {in: 6..30}

	protected

    def normalize_username
      self.username = self.username.downcase
    end
end
