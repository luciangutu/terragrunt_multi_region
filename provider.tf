# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
provider "aws" {
  region = "us-east-1"
  alias  = "a"
}
provider "aws" {
  alias  = "b"
  region = "eu-west-1"
}
provider "aws" {
  alias  = "c"
  region = "us-west-2"
}
provider "aws" {
  region = "us-east-1"
}
provider "aws" {
  region = "eu-west-1"
  alias  = "europe"
}
