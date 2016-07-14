class PullRequest < BaseIssue
  def github_url
    "https://github.com/#{organization_name}/#{repository_name}/pull/#{number}"
  end
end
