provider "aws" {
  assume_role {
    role_arn = "arn:aws:iam::${var.infra_homepage_prod_aws_account_id}:role/AccountManager"
  }
  region = "us-east-1"
}

provider "aws" {
  alias = "us_east_1"
  assume_role {
    role_arn = "arn:aws:iam::${var.infra_homepage_prod_aws_account_id}:role/AccountManager"
  }
  region = "us-east-1"
}

provider "aws" {
  alias = "infra_webapp_preprod"
  assume_role {
    role_arn = "arn:aws:iam::${var.infra_webapp_preprod_aws_account_id}:role/AccountManager"
  }
  region = "us-east-1"
}

provider "aws" {
  alias = "infra_webapp_prod"
  assume_role {
    role_arn = "arn:aws:iam::${var.infra_webapp_prod_aws_account_id}:role/AccountManager"
  }
  region = "us-east-1"
}
