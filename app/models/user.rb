class User < ActiveRecord::Base
attr_accessor:remember_token
has_many :blogs , dependent: :destroy
has_many :comments, dependent: :destroy
has_many :likes, dependent: :destroy
has_attached_file :image,  default_url: "/images/:style/missing.png"
validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
before_save{self.email=email.downcase}
validates :name ,presence:true ,length:{maximum:52}
REGEXa=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email,presence:true,length:{maximum:255}, format:{with:REGEXa},uniqueness:{case_sensitive:false}
has_secure_password
validates :password ,length:{minimum:6}, allow_blank:true

	def User.digest(string)
	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	BCrypt::Engine.cost
	BCrypt::Password.create(string, cost: cost)
	end


def feed
	Blog.where("user_id = ?", id) # '?' used to preven sql injection attacks
end
	def User.new_token
	SecureRandom.urlsafe_base64
	end
	
	
	def remember
	self.remember_token=User.new_token
	update_attribute(:remember_digest,User.digest(remember_token))
	end
	
	def authenticated?(remember_token)
	return false if remember_digest.nil?
	BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end
	
	def forget
	update_attribute(:remember_digest, nil)
	end
	
	
end
