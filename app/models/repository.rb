class Repository
  attr_reader :data

  def initialize data
    @data = data
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

  def open_issues_and_pull_requests_count
    @data["open_issues"]
  end

end
