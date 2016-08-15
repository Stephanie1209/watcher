class Admin::RepositoriesController < AdminController

  def index
    @repositories = Repository.all
  end

  def show
    @repository = Repository.find_by_name(params[:id])
  end

  def update_all
    repo = RepositoryService.new(params[:repo_name] || nil)
    repo.creates_or_updates_repositories
    redirect_to :back
  end

  def update
    repository = Repository.find(params[:id])
    repo = RepositoryService.new(repository.name)
    repo.creates_or_updates_repositories
    redirect_to :back
  end
end
