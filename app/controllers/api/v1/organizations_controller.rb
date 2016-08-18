class Api::V1::OrganizationsController < Api::V1::ApiController
  before_action :find_organization

  def show
  end

  def repositories_info
  end

  def issues_info
    @issues_count = @organization.issues.count
    @open_issues_count = @organization.issues.open.count
    @closed_issues_count = @organization.issues.closed.count
  end

  def pull_requests_info
    @pull_requests_count = @organization.pull_requests.count
    @open_pull_requests_count = @organization.pull_requests.open.count
    @closed_pull_requests_count = @organization.pull_requests.closed.count
  end

  def issues
    @issues = @organization.issues.all
  end

  def pull_requests
    @pull_requests = @organization.pull_requests.all
  end

  def commits
    if params[:since] && params[:to]
      @commits = Commit.between_dates(params[:since], params[:to]).group(:author).order('count_all desc').count
    elsif params[:since]
      @commits = Commit.since(params[:since]).group(:author).order('count_all desc').count
    elsif params[:to]
      @commits = Commit.to(params[:to]).group(:author).order('count_all desc').count
    else
      @commits = Commit.group(:author).order('count_all desc').count
    end
  end

  def stats
    @total = Commit.sum(:total)
    @additions = Commit.sum(:additions)
    @deletions = Commit.sum(:deletions)
  end

  private

  def find_organization
    @organization = Organization.where("github_name ilike ?", params[:id]).first
  end
end

