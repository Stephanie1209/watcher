class Api::V1::RepositoriesController < Api::V1::ApiController
  before_action :find_organization

  def index
    @repositories = @organization.repositories
  end

  def show
    @repository = @organization.repositories.where("name ilike ?", params[:id]).first
  end

  private

  def find_organization
    @organization = Organization.where("github_name ilike ?", params[:organization_id]).first
  end
end
