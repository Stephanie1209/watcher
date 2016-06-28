class GithubOrganization < GithubData
  def find(id)
    @organization ||= @client.organization(id)
  end

  def current
    @organization ||= @client.organization(github_organization)
  end

  def repositories
    @repositories ||= @client.organization_repositories(github_organization, query_options)
  end

end
