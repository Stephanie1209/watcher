class DashboardController < FrontendController
  before_action :organization

  def index
    @organization = organization
    @repositories = repositories
  end

  private

  def organization
    @github_organization = Organization.new github_organization
  end

  def repositories
    reps = organization.repositories
    reps.map! { |rep| Repository.new rep.name }
    reps.sort_by(&:open_issues_and_pull_requests_count).reverse
  end

  def github_organization
    Rails.application.secrets.github_organization
  end

end
