
class Organization
  attr_reader :repositories

  def initialize data
    @info = data
  end

  def github_account
    @info["html_url"]
  end

  def name
    @info["login"]
  end

  def public_repos
    @info["public_repos"]
  end

  def description
    @info["description"]
  end

  def private_repos
    @info["total_private_repos"]
  end

  def total_repos
    private_repos + public_repos
  end

  def avatar
    @info["avatar_url"]
  end
end
