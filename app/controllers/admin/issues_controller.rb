class Admin::IssuesController < AdminController
  def index
    @organization = Organization.find_by_github_name("IcaliaLabs")
    @repository = @organization.repositories.find_by_name(params[:repository_id])
    @issues = @repository.issues.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @issue = Issue.find(params[:id])
  end

  private

  def issues_params
    params.require(:issue).permit(:status)
  end
end
