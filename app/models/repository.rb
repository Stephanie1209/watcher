class Repository

  def initialize data
    @data = data
  end

  def name
    @data["name"]
  end

  def forks_count
    @data["forks_count"]
  end

  def stargazers
    @data["stargazers_count"]
  end

  def open_issues_and_pull_requests_count
    @data["open_issues"]
  end

end
