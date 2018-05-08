class Admin::SubmissionsController < Admin::ControllerBase
  before_action :fetch_contest
  SUBMISSIONS_PER_PAGE = 30

  def index
    @submissions = @contest.submissions
                           .page(params[:page]).per(SUBMISSIONS_PER_PAGE)
                           .reorder(created_at: :desc)
                           .includes(:problem, :data_set, :user)
  end

  def fastest_submission
    @submissions = @contest.submissions
                            .group(:data_set_id)
                            .order(created_at: :desc)
                            .preload(:user, :problem, :contest)
  end

  private
  def fetch_contest
    @contest = Contest.find_by_id(params[:contest_id])
  end
end
