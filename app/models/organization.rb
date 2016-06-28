class Organization

  def initialize data
    @data = data
  end

  def github_account
    @data["html_url"]
  end

  def name
    @data["login"]
  end

  def public_repos
    @data["public_repos"]
  end

  def description
    @data["description"]
  end

  def total_repos
    @data["total_private_repos"] + public_repos
  end

  def avatar
    @data["avatar_url"]
  end
end
