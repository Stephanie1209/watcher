class Repository < GithubData
  def initialize name
    super
    @name = name
    @information = @client.list_issues(github_repository)
  end

  def issues
    @information.reject{|i| i["pull_request"]}
  end

  def pull_requests
    @information.select{ |i| i["pull_request"] }
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

  private

  def github_repository
    "#{github_organization}/#{@name}"
  end

end
