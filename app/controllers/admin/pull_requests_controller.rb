class Admin::PullRequestsController < AdminController
  before_action :find_repository
  before_action :find_by_status, only: :index

  def index
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @pull_request = PullRequest.find(params[:id])
  end

  def update
    pull_request = @repository.pull_requests.find(params[:id])
    service = PullRequestService.new(@repository.name, pull_request.github_number)
    service.creates_or_updates_pull_request
    redirect_to admin_repository_pull_request_path(params[:repository_id], params[:id])
  end

  def update_all
    service = PullRequestService.new(@repository.name)
    service.creates_or_updates_pull_request
    redirect_to admin_repository_pull_requests_path(params[:repository_id])
  end

  private

  def find_repository
    @repository = Repository.find_by_name(params[:repository_id])
  end

  def find_by_status
    status = params[:status]
    @pull_requests = status.blank? ? @repository.pull_requests : @repository.pull_requests.where(status: status)
  end
end
