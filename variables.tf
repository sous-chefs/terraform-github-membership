variable "board" {
  type        = list(string)
  description = "A list of board members"
}

variable "bots" {
  type        = list(string)
  description = "A list of bot accounts"
}

variable "maintainers" {
  type        = list(string)
  description = "A list of maintainer accounts"
}
