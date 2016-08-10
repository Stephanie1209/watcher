class Api::V1::OrganizationsController < Api::V1::ApiController
  before_action :find_organization

  def show
  end

  def repositories_info
  end

  def issues_info
    @issues_count = Issue.joins(:repository).where("repositories.organization_id = ?", 1).count
    @open_issues_count = Issue.open.joins(:repository).where("repositories.organization_id = ?", 1).count
    @closed_issues_count = Issue.closed.joins(:repository).where("repositories.organization_id = ?", 1).count
  end

  def pull_requests_info
    @pull_requests_count = PullRequest.joins(:repository).where("repositories.organization_id = ?", 1).count
    @open_pull_requests_count = PullRequest.open.joins(:repository).where("repositories.organization_id = ?", 1).count
    @closed_pull_requests_count = PullRequest.closed.joins(:repository).where("repositories.organization_id = ?", 1).count
  end

  private

  def find_organization
    @organization = Organization.where("github_name ilike ?", params[:id]).first
  end
end

