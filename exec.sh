#!/bin/bash

# Define the namespace
namespace="obemfw"

kubectl create namespace "$namespace" |

# Array of YAML files to apply
yaml_files=("EL-Service-Account.yaml" "EL-Trigger-Binding.yaml" "EL-Trigger-Template.yaml" "Event-Listener.yaml" "Fetch-DB-task.yaml" "Flyway-task.yaml" "Git-Secret.yaml" "Vault-Secrets-Flyway-task.yaml" "Vault-Secrets-Postgres-Database-task.yaml" "jfrog-Service-Account.yaml" "jfrog-auth-secret.yaml" "vault-auth-secret.yaml")

# Loop through the array and apply each YAML file in the specified namespace
for file in "${yaml_files[@]}"
do
  kubectl apply -f "$file" -n "$namespace"
done