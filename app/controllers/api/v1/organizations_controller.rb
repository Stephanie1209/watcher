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

        all_issues_and_prs = @client.org_issues(params[:id], { filter: "all", state: "all" }).map { |issue| Issue.new issue }
        issues = all_issues_and_prs.select { |issue| !issue.pull_request? }
        @issues_count = issues.count
        @open_issues_count = issues.select { |issue| issue.state == "open" }.count
        @closed_issues_count = issues.select { |issue| issue.state == "closed" }.count
      end
    end
  end
end
