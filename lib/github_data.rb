require 'octokit'

class GithubData
  attr_reader :client

  def initialize
    @client = Octokit::Client.new(access_token: github_token)
  end

  private

  def github_token
    Rails.application.secrets.github_access_token
  end

  def github_organization
    Rails.application.secrets.github_organization
  end

  def query_options
    { query: { per_page: 100, page: 1 } }
  end
end
