module Api
  module V1
    class OrganizationsController < ApiController

      def show
        @organization = find_github_organization(params[:id])
      end

      def repositories_info
        @organization = find_github_organization(params[:id])
      end

      def issues_info
        @organization = find_github_organization(params[:id])
        all_issues_and_prs = @client.org_issues(params[:id], issues_query_options).map { |issue| Issue.new issue }
        issues = all_issues_and_prs.select { |issue| !issue.pull_request? }
        @issues_count = issues.count
        @open_issues_count = issues.count { |issue| issue.state == "open" }
        @closed_issues_count = issues.count { |issue| issue.state == "closed" }
      end

      def pull_requests_info
        @organization = find_github_organization(params[:id])
        all_issues_and_prs = @client.org_issues(params[:id], issues_query_options).map { |pr| PullRequest.new pr }
        pull_requests = all_issues_and_prs.select { |pr| pr.pull_request? }
        @pull_requests_count = pull_requests.count
        @open_pull_requests_count = pull_requests.count { |pr| pr.state == "open" }
        @closed_pull_requests_count = pull_requests.count { |pr| pr.state == "closed" }
      end

      private

      def issues_query_options
        { filter: "all", state: "all" }
      end
    end
  end
end
