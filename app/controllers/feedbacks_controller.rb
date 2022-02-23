class FeedbacksController < ApplicationController
  def index
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.image.attach(params[:feedback][:image])
    @feedback.user_id = current_user.id
    if @feedback.save
      flash[:success] = "Feedback was sent"
      redirect_to feedback_path
    else
      render 'index'
    end
  end

  def update
    if @feedback.update(feedback_params)
      flash[:success] = "Feedback was sent "
      redirect_to feedbacks_index_path
    else
      render 'edit'
    end
  end

  private
    def feedback_params
      params.require(:feedback).permit(:name, :product , :comment)
    end
end
