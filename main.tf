resource "github_membership" "maintainers" {
  for_each = toset(var.maintainers)
  username = each.key
  role     = "member"
}

resource "github_team_membership" "maintainers" {
  for_each = toset(compact(distinct(concat(var.maintainers, var.board))))
  username = each.key
  role     = "maintainer"
  team_id  = github_team.maintainers.id
}

resource "github_team" "maintainers" {
  name        = "maintainers"
  description = "Sous-Chefs Maintainers"
  privacy     = "closed"
}

resource "github_membership" "board" {
  for_each = toset(var.board)
  username = each.key
  role     = "admin"
}

resource "github_team_membership" "board" {
  for_each = toset(var.board)
  username = each.key
  team_id  = github_team.board.id
  role     = "maintainer"
}

resource "github_team" "board" {
  name        = "board"
  description = "Sous-Chefs Board"
  privacy     = "closed"
}

# Kitchen Porter is not added to this list on purpose
resource "github_membership" "bots" {
  for_each = toset(var.bots)
  username = each.key
  role     = "member"
}

resource "github_team_membership" "bots" {
  for_each = toset(var.bots)
  username = each.key
  team_id  = github_team.bots.id
}

resource "github_team" "bots" {
  name        = "bots"
  description = "Sous-Chefs Bots"
  privacy     = "closed"
}
