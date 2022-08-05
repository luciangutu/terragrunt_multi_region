locals {
  # Automatically load region-level variables
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  aws_regions = local.region_vars.locals.aws_regions
}

# Generate an AWS provider block for multi-region
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.aws_regions[0]}"
  alias  = "a"
}
provider "aws" {
  alias  = "b"
  region = "${local.aws_regions[1]}"
}
provider "aws" {
  alias  = "c"
  region = "${local.aws_regions[2]}"
}
provider "aws" {
  region = "${local.aws_regions[0]}"
}
provider "aws" {
  region = "eu-west-1"
  alias  = "europe"
}
EOF
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "local" {}
}
EOF
}

