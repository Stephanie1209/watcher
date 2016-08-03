class Admin::CommitsController < AdminController
  def index
    @commits = []
    @repository = Repository.find(params[:repository_id])
    commits_for params[:branch_id], params[:since], params[:until]
  end

  def commits_for branch_id, since_date = nil, until_date = nil
    master = @repository.branches.find_by_name("master")
    @commits = @repository.branches.find(branch_id || master).commits
    @commits =  if !since_date.blank? && !until_date.blank?
                  @commits.where(committed_at: since_date..until_date )
                elsif since_date.blank? && !until_date.blank?
                  @commits.where("committed_at <= ?", until_date)
                elsif !since_date.blank? && until_date.blank?
                  @commits.where("committed_at >= ?", since_date)
                else
                  @commits = @repository.branches.find(branch_id).commits
                end
  end
end
