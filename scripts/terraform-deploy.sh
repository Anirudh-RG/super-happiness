#!/bin/bash
echo "Initializing Terraform..."
terraform init

echo "Planning Terraform..."
terraform plan -out=tfplan

echo "Applying Terraform..."
echo "yes" | terraform apply tfplan  # Automating confirmation

echo "Deployment complete."
