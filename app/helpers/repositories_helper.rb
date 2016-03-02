module RepositoriesHelper

  def issue_link repository_name, number
    "https://github.com/IcaliaLabs/#{repository_name}/issues/#{number}"
  end

  def pull_request_link repository_name, number
    "https://github.com/IcaliaLabs/#{repository_name}/pull/#{number}"
  end
end
