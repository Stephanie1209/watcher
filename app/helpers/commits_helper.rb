module CommitsHelper

  def branches_combo branches
    branches.pluck(:name)
  end

  def count_commits(repo,params)
    if params[:since] && params[:to]
      @commits = repo.between_dates(params[:since], params[:to])
    elsif params[:since]
      @commits = repo.since(params[:since])
    elsif params[:to]
      @commits = repo.to(params[:to])
    else
      @commits = repo
    end
    @commits.group(:author).order('count_all_desc').count
  end

end
