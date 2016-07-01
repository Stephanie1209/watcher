class Organization < GithubData
    attr_reader :repositories
    
  def initialize
    super
    @organization ||= @client.organization(github_organization)
    @repositories ||= @client.organization_repositories(github_organization, query_options)
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

  def total_repos
    @organization["total_private_repos"] + public_repos
  end

  def avatar
    @organization["avatar_url"]
  end

  private
  def find(id)
    @organization ||= @client.organization(id)
  end

end
