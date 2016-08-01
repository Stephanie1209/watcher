class Admin::IssuesController < AdminController
  def index
    get_organization_and_repository
    @issues = @repository.issues.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @issue = Issue.find(params[:id])
    @repository = Repository.find(params[:repository_id])
  end

  def update
    @repository = Repository.find(params[:repository_id])
    issue = @repository.issues.find(params[:id])
    service = IssueService.new(@repository.name, issue.github_number)
    service.creates_or_updates_issue
    redirect_to admin_repository_issue_path(params[:repository_id], params[:id])
  end

  def update_all
    get_organization_and_repository
    service = IssueService.new(@repository.name)
    service.creates_or_updates_issue
    redirect_to admin_repository_issues_path(params[:repository_id])
  end

  private

  def get_organization_and_repository
    @organization = Organization.find_by_github_name(Rails.application.secrets.github_organization)
    @repository = @organization.repositories.find_by_name(params[:repository_id])
  end
end
