class ReviewsController < ApplicationController
   before_filter :load_parent

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = current_user.written_reviews.build(review_params)


    # Check out this article on [.build](http://stackoverflow.com/questions/783584/ruby-on-rails-how-do-i-use-the-active-record-build-method-in-a-belongs-to-rel)
    # You could use a longer alternate syntax if it makes more sense to you
    #
    # @review = Review.new(
    #   comment: params[:review][:comment],
    #   project_id: @project.id,
    #   user_id: current_user.id
    # )

    if @review.save
      respond_to do |format|
        format.html do
          if @parent == 'projects'
            redirect_to project_path(@project), notice: 'Review created successfully'
          elsif @parent == 'users'
            redirect_to user_path(@user), notice: 'Review created successfully'
          end
        end

        format.js
      end
    else
      render 'projects/show'
    end
  end




  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def review_params
    params.require(:review).permit(:comment, :reviewable_type, :reviewable_id)
  end


  def load_parent

    path = request.path
    split_path = path.split("/")
    @parent = split_path[1]
    @parent_id = split_path[2].to_i
    if @parent == "projects"
      @project = Project.find(@parent_id)
    elsif @parent == "users"
      @user = User.find(@parent_id)
    end
  end
end
