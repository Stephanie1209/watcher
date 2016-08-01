class Admin::PullRequestsController < AdminController
  def index
    get_organization_and_repository
    @pull_requests = @repository.pull_requests.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @pull_request = PullRequest.find(params[:id])
    @repository = Repository.find(params[:repository_id])
  end

  def update
    @repository = Repository.find(params[:repository_id])
    pull_request = @repository.pull_requests.find(params[:id])
    service = PullRequestService.new(@repository.name, pull_request.github_number)
    service.creates_or_updates_pull_request
    redirect_to admin_repository_pull_request_path(params[:repository_id], params[:id])
  end

  def update_all
    get_organization_and_repository
    service = PullRequestService.new(@repository.name)
    service.creates_or_updates_pull_request
    redirect_to admin_repository_pull_requests_path(params[:repository_id])
  end

  private

  def get_organization_and_repository
    @organization = Organization.find_by_github_name(Rails.application.secrets.github_organization)
    @repository = @organization.repositories.find_by_name(params[:repository_id])
  end
end
