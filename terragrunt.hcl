remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "scalr-terragrunt-state-spodhorov"
    key    = "${path_relative_to_include()}/terraform.tfstate"
    region = "us-east-1"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}
EOF
}
```

5. Commit у `main`

Після цього структура буде:
```
scalr-terragrunt-demo/
├── terragrunt.hcl          ← ОСЬ ЦЕЙ ФАЙЛ
├── dev/
│   ├── app/terragrunt.hcl
│   ├── database/terragrunt.hcl
│   └── server/terragrunt.hcl
├── modules/
│   ├── app/
│   ├── database/
│   └── server/
└── README.md
