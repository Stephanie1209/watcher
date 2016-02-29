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

  def pull_requests
    @searcher.get_pull_requests
  end


end
