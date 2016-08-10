json.repositories @repositories do |repository|
  json.name repository.name
  json.stargazers repository.stars
  json.open_issues repository.issues.open.count
  json.closed_issues repository.issues.closed.count
  json.open_pull_requests repository.pull_requests.open.count
  json.closed_pull_requests repository.pull_requests.closed.count
end
