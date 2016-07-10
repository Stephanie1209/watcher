json.repositories @repositories do |repository|
  json.name repository.name
  json.description repository.description
  json.stargazers repository.stargazers
  json.open_issues repository.open_issues.count
  json.open_pull_requests repository.open_pull_requests.count
end
