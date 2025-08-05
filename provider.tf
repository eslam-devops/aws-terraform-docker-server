provider "aws" {
  region  = "us-east-1"        # المنطقة في AWS (فرجينيا)
  profile = "terraform_dev"    # اسم البروفايل اللي استخدمته في aws configure
  default_tags {
    tags = {
      Project     = "Free-Docker-Learning"
      Environment = "Learning"
      Billing     = "Free-Tier"
      ManagedBy   = "Terraform"
    }
  }
}