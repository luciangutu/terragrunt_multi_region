# Set common variables for the region. This is automatically pulled in in the root terragrunt.hcl configuration to
# configure the remote state bucket and pass forward to the child modules as inputs.
# This parameter is overwritten in Jenkins!
locals {
  aws_region = "us-east-1"
  aws_regions = [ "us-east-1", "eu-west-1", "us-west-2" ]
}
