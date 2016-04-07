class GithubOrganization < GithubData

  def current
    @organization ||= @client.organization(github_organization)
  end

  def repositories
    @repositories ||= @client.organization_repositories(github_organization, query_options)
  end

end
