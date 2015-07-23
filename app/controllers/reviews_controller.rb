class ReviewsController < ApplicationController
   before_filter :load_project

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @project.reviews.build(review_params)
    @review.user = current_user

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
          redirect_to project_path(@project), notice: 'Review created successfully'
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
    params.require(:review).permit(:comment, :project_id)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end
end
