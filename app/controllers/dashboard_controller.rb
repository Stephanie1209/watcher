class DashboardController < ApplicationController
  before_action :organization

  def index
    @organization = organization
    @repositories = repositories
  end

  private

  def organization
    @github_organization = Organization.new
  end

  def repositories
    reps = organization.repositories
    reps.map! { |rep| Repository.new rep.name }
    reps.sort_by(&:open_issues_and_pull_requests_count).reverse
  end

end
