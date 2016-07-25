class Admin::IssuesController < AdminController
  def index
    @organization = Organization.find_by_github_name("IcaliaLabs")
    @repository = @organization.repositories.find_by(name: params[:repository_id])
    @issues = @repository.issues.all
  end

  def show
    @issue = Issue.find(params[:id])
  end
end
