class Repository < GithubData
  def initialize name
    super
    @name = name
    @repositories = @client.list_issues(github_repository)
    @information = @client.repo(github_repository)
  end

  def id
    @information["id"]
  end

  def name
    @information["name"]
  end

  def forks_count
    @information["forks_count"]
  end

  def stargazers
    @information["stargazers_count"]
  end

  def open_issues_and_pull_requests_count
    @information["open_issues"]
  end

  def issues
    @repositories.reject{|i| i["pull_request"]}
  end

  def pull_requests
    @repositories.select{ |i| i["pull_request"] }
  end

  private

  def github_repository
    "#{github_organization}/#{@name}"
  end

end
