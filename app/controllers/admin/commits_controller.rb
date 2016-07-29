class Admin::CommitsController < AdminController
  def index
    @commits = []
    @repository = Repository.find(params[:repository_id])
    if params[:branch_id]
      @commits = @repository.branches.find(params[:branch_id]).commits
      respond_to do |format|
        format.js
      end
    else
      @commits = @repository.branches.find_by_name("master").commits
    end
  end
end
