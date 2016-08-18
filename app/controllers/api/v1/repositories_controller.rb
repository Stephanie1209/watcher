class Api::V1::RepositoriesController < Api::V1::ApiController
  before_action :find_organization

  def index
    @repositories = @organization.repositories
  end

  def show
    @repository = @organization.repositories.where("name ilike ?", params[:id]).first
  end

  def commits
    repository = Repository.find_by_name(params[:repository_id])
    if params[:since] && params[:to]
      @commits = repository.commits.between_dates(params[:since], params[:to]).group(:author).order('count_all desc').count
    elsif params[:since]
      @commits = repository.commits.since(params[:since]).group(:author).order('count_all desc').count
    elsif params[:to]
      @commits = repository.commits.to(params[:to]).group(:author).order('count_all desc').count
    else
      @commits = repository.commits.group(:author).order('count_all desc').count
    end
  end

  private

  def find_organization
    @organization = Organization.where("github_name ilike ?", params[:organization_id]).first
  end
end
