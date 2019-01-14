class LikesController < ApplicationController



	def create
		@user_id=params[:user_id]
		@blog_id=params[:blog_id]

		@like=Like.new(user_id:@user_id,blog_id:@blog_id)
		if !already_liked?(@user_id,@blog_id)

			if @like.save
				redirect_to request.referrer
			else
				redirect_to root_url
			end
		else
			redirect_to request.referrer
		end
	end


	def destroy

	end

	def show
		@reliker=Like.find(params[:id])
		@user_id=current_user.id
		@blog_id=@reliker.blog_id
		#params[:blog_id]
		#debugger
		if already_liked?(@user_id,@blog_id)
		
			@unlike=Like.where(user_id:@user_id,blog_id:@blog_id)

			if 	@unlike.destroy(@unlike.ids[0])
				redirect_to request.referrer

			else
				redirect_to root_url
			end
		else
			redirect_to root_url
		end
	end


	def already_liked?(u,b)
		Like.where(user_id:u,blog_id:b).exists?
	end
	

	

end
