module Api
  module V1
    class OrganizationsController < ApiController

      def show
        @organization = find_github_organization(params[:organization_id])
      end

      def repositories_info
        @organization = find_github_organization(params[:organization_id])
      end

      def issues_info
        @organization = find_github_organization(params[:organization_id])

        all_issues_and_prs = @client.org_issues(params[:organization_id], { filter: "all", state: "all" }).map { |issue| Issue.new issue }
        issues = all_issues_and_prs.select { |issue| !issue.pull_request? }
        @issues_count = issues.count
        @open_issues_count = issues.count { |issue| issue.state == "open" }
        @closed_issues_count = issues.count { |issue| issue.state == "closed" }
      end
    end
  end
end
