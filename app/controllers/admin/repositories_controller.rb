class Admin::RepositoriesController < AdminController
  def index
    @repositories = Repository.all
  end

  def update_repositories
    github_client
    repositories = @client.repositories(ENV["github_organization"])
    repositories.each do |repo|
      repository = Repository.find_by_name(repo["name"]) || Repository.new
      repository.update(
                  name: repo["name"],
                  stars: repo["stargazers_count"],
                  forks_count: repo["forks_count"],
                  started_at: repo["created_at"]
                  )
    end
    redirect_to admin_repositories_path
  end
end
