class Admin::FeedbacksController < Admin::AdminController
  before_action :find_feedback,only: [:show, :update, :destroy ]

  def index
    @feedbacks = Feedback.all
  end

  def show
  end

  def update
    if @feedback.update(feedback_params)
      flash[:success] = "Feedback recieved"
      redirect_to admin_feedbacks_path
    else
      render 'edit'
    end
  end

  def destroy
    @feedback.destroy
    flash[:success] = "Feedback Solved"
    redirect_to admin_feedbacks_path
  end

  private

    def find_feedback
        @feedback = Feedback.find_by(id: params[:id])
        redirect_to admin_feedbacks_path unless @feedback
    end

    def feedback_params
      params.require(:feedback).permit(:name, :content)
    end
end
