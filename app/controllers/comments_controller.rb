class CommentsController < ApplicationController


before_action :logged_in_user 


	def show
		@blog=Blog.find_by(id: params[:id])
		@user=User.find_by(id: @blog.user_id)
		@comments=Comment.new
		#@display_comments=@blog.comments
	end

	def create 
		
		@blog=Blog.find_by(id: params[:id])
		#@user=User.find_by(id: @blog.user_id)
		@user=current_user
		@wy=@blog.comments.build(comment_params)
		@wy.user_id=@user.id
		if @wy.save
			flash[:success] = "Comment created!"
			redirect_to request.referrer || root_url 
		else
			render 'static_page/home'
		end
		

	end


	private

	def comment_params
		params.require(:comment).permit(:body)
	end
end
