class Repository < GithubData
  attr_accessor :issues
  def initialize data
    super
    @data = data
    @issues = []
  end

  def id
    @data["id"]
  end

  def name
    @data["name"]
  end

  def description
    @data["description"]
  end

  def forks_count
    @data["forks_count"]
  end

  def stargazers
    @data["stargazers_count"]
  end

  def issues
    @issues
  end

  def open_issues
    @issues.select{|i| !i.pull_request && i.state == "open"}
  end

  def open_pull_requests
    @issues.select{ |i| i.pull_request || i.state == "open" }
  end

  def open_issues_and_pull_requests_count
    @data["open_issues"]
  end

  private

  def github_repository
    @data["full_name"]
  end

end
