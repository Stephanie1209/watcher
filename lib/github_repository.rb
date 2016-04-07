class GithubRepository < GithubData
  attr_reader :name

  def initialize name
    @name = name
    super()
  end

  def search_information
    @information ||= @client.list_issues(github_repository)
  end

  def issues
    search_information
    @information.reject{|i| i["pull_request"]}
  end

  def pull_requests
    search_information
    @information.select{ |i| i["pull_request"] }
  end
  private

  def github_repository
    "#{github_organization}/#{@name}"
  end

end
