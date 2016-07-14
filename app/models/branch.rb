class Branch
  def initialize data
    @data = data
  end

  def name
    @data["name"]
  end

  def sha
    @data["commit"]["sha"]
  end

  def url
    @data["commit"]["url"]
  end
end
