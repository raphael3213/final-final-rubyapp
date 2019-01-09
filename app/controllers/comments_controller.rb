class CommentsController < ApplicationController


before_action :logged_in_user 


	def show
		# render json: params and return
		@blog=Blog.find_by(id: params[:id])
		
		if @blog.nil?
			flash[:danger]="page 404"
			redirect_to root_url
		else
		@user=User.find_by(id: @blog.user_id)
		@comments=Comment.new
		@display_comments=@blog.comments
		respond_to do |format|
					format.html { }
					format.js   { }
					end
		end
	end

	def create 
		@blog=Blog.find_by(id: params[:id])
		#@user=User.find_by(id: @blog.user_id)
		@user=current_user
		@wy=@blog.comments.build(comment_params)
		@wy.user_id=@user.id
		if @wy.save
			flash.now[:success] = "Comment created!"
				 redirect_to request.referrer || root_url
				#render :show
			else
			render 'static_page/home'
		end
	end


	private

	def comment_params
		params.require(:comment).permit(:body)
	end
end
