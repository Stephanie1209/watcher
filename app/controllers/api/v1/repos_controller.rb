class Api::V1::ReposController < Api::V1::ApiController
  before_action :find_repository

  def all_issues
    @issues = @repository.issues
  end

  def open_issues
    @open_issues = @repository.issues.open
  end

  def closed_issues
    @closed_issues = @repository.issues.closed
  end

  def all_pull_requests
    @pull_requests = @repository.pull_requests
  end

  def open_pull_requests
    @open_pull_requests = @repository.pull_requests.open
  end

  def closed_pull_requests
    @closed_pull_requests = @repository.pull_requests.closed
  end

  def branches
    @branches = @repository.branches
  end

  def commits
    repository = Repository.find_by_name(params[:name])
    #En vez de los ifs llamas a la función count_commits, mandandole el repo que buscas arriba
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

  def find_repository
    organization = Organization.where("github_name ilike ?", params[:organization_id]).first
    @repository = organization.repositories.where("name ilike ?", params[:repository_id]).first
  end
end

