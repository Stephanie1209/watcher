class Admin::RepositoriesController < AdminController
  def index
    @repositories = Repository.all
  end

  def show
    @repository = Repository.find(params[:id])
  end

  def update_specific_repository
    repo = RepositoryService.new(ENV["github_organization"], params[:repo_name])
    repo.creates_or_updates_repository
    redirect_to :back
  end

  def update_repositories
    github_client
    repositories = @client.org_repos(ENV["github_organization"],
                            { query: { per_page: 100, page: 1 } })
    repositories.each do |repo|
      creates_or_updates_repository repo
    end
    redirect_to admin_repositories_path
  end

  def creates_or_updates_repository repo
    organization = Organization.find_by_github_name(ENV["github_organization"])
    repository = organization.repositories.find_by_name(repo["name"]) || organization.repositories.new
    repository.update(
                      name: repo["name"],
                      stars: repo["stargazers_count"],
                      forks_count: repo["forks_count"],
                      started_at: repo["created_at"]
                      )
  end
end
