terraform {
  required_providers {
    random = { source = "hashicorp/random", version = ">= 3.7.0" }
  }
}

variable "canary" {
  type    = bool
  default = false
}

ephemeral "random_password" "p" {
  length = 16
}

resource "terraform_data" "x" {
  input = "static"
}

# Changes on every plan, standing in for out-of-band drift
resource "terraform_data" "canary" {
  count = var.canary ? 1 : 0
  input = timestamp()
}
