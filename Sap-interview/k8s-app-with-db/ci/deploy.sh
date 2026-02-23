
#!/bin/bash
set -e

ENV=$1

cd terraform/environments/$ENV
terraform init
terraform apply -auto-approve -var-file="$ENV.tfvars"

DB_ENDPOINT=$(terraform output -raw endpoint)
DB_PASSWORD=$(terraform output -raw password)

cd ../../../

helm upgrade --install app ./helm/app   --set database.host=$DB_ENDPOINT   --set database.password=$DB_PASSWORD
