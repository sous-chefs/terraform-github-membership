resource "github_membership" "maintainers" {
  for_each = toset(var.maintainers)
  username = each.key
  role     = "member"
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

resource "github_team" "bots" {
  name        = "bots"
  description = "Sous-Chefs Bots"
  privacy     = "closed"
}
