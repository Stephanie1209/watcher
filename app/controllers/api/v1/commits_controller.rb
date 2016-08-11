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
      @commits = branch.commits.select { |commit| (commit.committed_at <=> since) != -1 && (commit.committed_at <=> to) != 1 }
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
      @commits = @repository.commits.select { |commit| (commit.committed_at <=> since) != -1 && (commit.committed_at <=> to) != 1 }
    end
  end

  def find_repository
    @repository = Repository.find_by_name(params[:repo_id])
  end
end

