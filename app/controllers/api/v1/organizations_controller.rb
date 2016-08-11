class Api::V1::OrganizationsController < Api::V1::ApiController
  before_action :find_organization

  def show
  end

  def repositories_info
  end

  def issues_info
    @issues_count = @organization.issues.count
    @open_issues_count = @organization.issues.open.count
    @closed_issues_count = @organization.issues.closed.count
  end

  def pull_requests_info
    @pull_requests_count = @organization.pull_requests.count
    @open_pull_requests_count = @organization.pull_requests.open.count
    @closed_pull_requests_count = @organization.pull_requests.closed.count
  end

  private

  def find_organization
    @organization = Organization.where("github_name ilike ?", params[:id]).first
  end
end

