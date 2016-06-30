class GithubOrganization < GithubData

  def find(id)
    @organization ||= @client.organization(id)
  end

  def find_respositories(id)
    @repositories ||= @client.organization_repositories(id, query_options)
  end

  def current
    @organization ||= @client.organization(github_organization)
  end

  def repositories
    @repositories ||= @client.organization_repositories(github_organization, query_options)
  end

end
