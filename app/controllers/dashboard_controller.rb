class DashboardController < ApplicationController
  before_action :retrieve_data_from_github
  
  def index
    @organization = organization
    @repositories = repositories
  end

  private

  def retrieve_data_from_github
    @github_organization = GithubOrganization.new
  end

  def organization
    Organization.new(@github_organization.current)
  end

  def repositories
    reps = @github_organization.repositories
    reps.map! { |rep| Repository.new rep }
    reps.sort_by(&:open_issues_and_pull_requests_count).reverse
  end
end
