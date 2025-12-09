terraform {
  backend "s3" {
    bucket       = "w7-julio-terra-project"  # Replace with your bucket name
    key          = "week7/terraform.tfstate" # Path inside the bucket
    region       = "us-east-1"               # Bucket region
    use_lockfile = false                     # Enable server-side encryption

  }
}