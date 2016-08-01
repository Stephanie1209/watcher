class Admin::IssuesController < AdminController
  before_action :find_repository

  def index
    @issues = @repository.issues.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def update
    issue = @repository.issues.find(params[:id])
    service = IssueService.new(@repository.name, issue.github_number)
    service.creates_or_updates_issue
    redirect_to admin_repository_issue_path(params[:repository_id], params[:id])
  end

  def update_all
    service = IssueService.new(@repository.name)
    service.creates_or_updates_issue
    redirect_to admin_repository_issues_path(params[:repository_id])
  end

  private

  def find_repository
    @repository = Repository.find_by_name(params[:repository_id])
  end
end
