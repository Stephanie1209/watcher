class Api::V1::CommitsController < Api::V1::ApiController
  before_action :find_repository

  def show
    @commit = @repository.commits.find_by_sha(params[:sha])
  end

  def index
    if params[:since] && params[:until]
      find_all_commits_between
    else
      find_all_commits
    end
  end

  private

  def obtain_branch_commits
    if params[:since] && params[:until]
      since = Date.parse(params[:since])
      to = Date.parse(params[:until])
      branch = @repository.branches.find_by_name(params[:branch])
      @commits = branch.commits.between_dates(since, to)
    else
      branch = @repository.branches.find_by_name(params[:branch])
      @commits = branch.commits
    end
  end

  def find_all_commits
    if params[:branch]
      obtain_branch_commits
    else
      @commits = @repository.commits.all
    end
  end

  def find_all_commits_between
    if params[:branch]
      obtain_branch_commits
    else
      since = Date.parse(params[:since])
      to = Date.parse(params[:until])
      @commits = @repository.commits.between_dates(since, to)
    end
  end

  def find_repository
    @organization = Organization.where("github_name ilike ?", params[:organization_id]).first
    @repository = @organization.repositories.where("name ilike ?", params[:repo_id]).first
  end
end

