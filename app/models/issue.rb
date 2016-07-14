class Issue < BaseIssue
  def github_url
    "https://github.com/#{organization_name}/#{repository_name}/issues/#{number}"
  end
end


