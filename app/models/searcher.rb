class Searcher
  include HTTParty
  base_uri 'https://api.github.com'

  def initialize name
    @name = name
    @options = { query: {per_page: 100, page: 1} } 
  end

  def get_organization
    get_url("/orgs/#{@name}")
  end

  def get_repositories
    get_url("/orgs/#{@name}/repos", @options)
  end

  def get_issues_and_pull_requests repo_name
    data = get_url("/repos/#{@name}/#{repo_name}/issues", @options)
    { issues: data.reject{|d| d["pull_request"]}, pull_requests: data.select{|d| d["pull_request"] } }
  end

  def get_pull_requests
    issues = get_issues
    issues.select{|i| i["pull_request"]}
  end

  def find_repository repository_id
    get_url("/repos/#{@name}/#{repository_id}", @options)
  end

  private

  def github_token
    Rails.application.secrets.github_access_token
  end

  def get_url path, options = {}
    self.class.get("#{path}?access_token=#{github_token}", options)
  end
end
