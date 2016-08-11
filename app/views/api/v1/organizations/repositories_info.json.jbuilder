json.total_repos @organization.repositories.count
json.public_repos @organization.repositories.is_public.count
json.private_repos @organization.repositories.is_private.count
