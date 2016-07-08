class Base
  attr_reader :data
  def initialize data
    @data = data
  end

  def id
    @data["id"]
  end

  def number
    @data["number"]
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

  def pull_request
    @data["pull_request"] != nil
  end

  def labels
    @data["labels"].map{|label| label["name"]}.join(",")
  end

  def created_at
    @data["created_at"].to_date
  end

  def repository_name
    @data["repository_url"].split("/").last
  end

  def repository_id
    @data["repository"]["id"]
  end

  def organization_name
    @data["repository_url"].split("/")[4]
  end
end

class Issue < Base

  def github_url
    "https://github.com/#{organization_name}/#{repository_name}/issues/#{number}"
  end
end

class PullRequest < Base

  def github_url
    "https://github.com/#{organization_name}/#{repository_name}/pull/#{number}"
  end
end
