class Mapper

  def initialize
    @searcher = Searcher.new "IcaliaLabs"
  end

  def organization
    data = @searcher.get_organization
    Organization.new @searcher.get_organization
  end

  def repositories
    reps = @searcher.get_repositories
    reps.map { |rep| Repository.new rep }
  end

  def issues_and_pull_requests repo_name
    info = @searcher.get_issues_and_pull_requests repo_name
    {issues: info[:issues].map{|i| Issue.new i}, pull_requests: info[:pull_requests].map{|p| PullRequest.new p}}
  end

  def find_repository repository_id
    Repository.new (@searcher.find_repository repository_id)
  end

end
