json.sha @commit.sha
json.author @commit.author_name
json.message @commit.message
json.stats do
  json.additions @commit.stats_additions
  json.deletions @commit.stats_deletions
  json.total @commit.stats_total
end
