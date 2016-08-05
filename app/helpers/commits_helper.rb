module CommitsHelper

  def branches_combo branches
    branches.pluck(:name)
  end
end
