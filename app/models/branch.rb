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
    @data["commit"]["sha"]
  end

  def protected
    @data["protected"]
  end

  def protection_url
    @data["protection_url"]
  end
end
