class Api::V1::CommitsController < Api::V1::ApiController
  before_action :find_repository

  def show
    @commit = @repository.commits.find_by_sha(params[:sha])
  end

  def index
    if params[:branch]
      obtain_branch_commits
    elsif params[:since] && params[:until]
      find_all_commits_between(@repository)
    else
      find_all_commits
    end
  end

  private

  def obtain_branch_commits
    branch = @repository.branches.find_by_name(params[:branch])
    if params[:since] && params[:until]
      find_all_commits_between(branch)
    end
  end

  def find_all_commits
      @commits = @repository.commits.all
  end

  def find_all_commits_between repo
      since = Date.parse(params[:since])
      to = Date.parse(params[:until])
      @commits = repo.commits.between_dates(since, to)
  end

  def find_repository
    @organization = Organization.where("github_name ilike ?", params[:organization_id]).first
    @repository = @organization.repositories.where("name ilike ?", params[:repo_id]).first
  end
end
