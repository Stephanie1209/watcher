class Admin::RepositoriesController < AdminController
  def index
    @repositories = Repository.all
  end

  def show
    @repository = Repository.find(params[:id])
  end

  def update_specific_repository
    repo = RepositoryService.new(params[:repo_name])
    repo.creates_or_updates_specific_repository
    redirect_to :back
  end

  def update_repositories
    repo = RepositoryService.new
    repo.creates_or_updates_repositories
    redirect_to :back
  end
end
