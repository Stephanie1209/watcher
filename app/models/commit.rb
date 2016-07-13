class Commit
  def initialize data
    @info = data
  end

  def sha
    @info["sha"]
  end

  def author
    @info["author"]
  end

  def message
    @info["message"]
  end

  def stats_additions
    @info["stats"]["additions"]
  end

  def stats_deletions
    @info["stats"]["deletions"]
  end

  def stats_total
    @info["stats"]["total"]
  end
end
