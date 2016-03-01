class Base
  def initialize data
    @data = data
  end

  def title
    @data["title"]
  end

  def author
    @data["user"]["login"]
  end

  def state
    @data["state"]
  end

  def labels
    @data["labels"].map{|label| label["name"]}.join(",")
  end

  def created_at
    @data["created_at"].to_date
  end
end

class Issue < Base

end

class PullRequest < Base

end
