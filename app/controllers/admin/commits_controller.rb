class Admin::CommitsController < AdminController
  def index
    @commits = []
    @repository = Repository.find(params[:repository_id])
    if params[:branch_id]
      commits_for params[:branch_id], params[:since], params[:until]
    else
      @commits = @repository.branches.find_by_name("master").commits
    end
  end

  def commits_for branch_id, since_date = nil, until_date = nil
    @commits = @repository.branches.find(branch_id).commits
    unless (since_date && until_date) == ""
      @commits = @commits.where(committed_at: since_date..until_date )
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
end
