
class Organization < GithubData
  attr_reader :repositories
  def initialize id
    super
    @organization ||= @client.organization(id)
  end



  def github_account
    @organization["html_url"]
  end

  def name
    @organization["login"]
  end

  def public_repos
    @organization["public_repos"]
  end

  def description
    @organization["description"]
  end

  def private_repos
    @organization["total_private_repos"]
  end

  def total_repos
    private_repos + public_repos
  end

  def avatar
    @organization["avatar_url"]
  end
end
