json.issues @closed_issues do |issue|
  json.id issue.id
  json.github_url issue.github_url
  json.number issue.number
  json.title issue.title
  json.body issue.body
  json.author issue.author
  json.labels issue.labels
  json.assignee issue.assignee if issue.assignee != nil
  json.created_at issue.created_at
end
