terraform {
  cloud {
    organization = "demo"

    workspaces {
      name = "dev"
    }
  }
}