module RepositoriesHelper

  def issue_link repository_name, number
    sanitize("https://github.com/IcaliaLabs/#{repository_name}/issues/#{number}")
  end

  def pull_request_link repository_name, number
    sanitize("https://github.com/IcaliaLabs/#{repository_name}/pull/#{number}")
  end

  def link_to_pull_request title, repo_name, number
    link_to title, pull_request_link(repo_name, number), target: "_blank"
  end

  def link_to_issue title, repo_name, number
    link_to title, issue_link(repo_name, number), target: "_blank"
  end
end
