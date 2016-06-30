json.repositories @repositories do |repository|
  json.name repository.name
  json.description repository.description
  json.stargazers repository.stargazers
end
