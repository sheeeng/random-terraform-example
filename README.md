# random-terraform-examples

```bash
terraform init \
    && terraform init -reconfigure -upgrade \
    && terraform fmt -recursive . \
    && terraform validate . \
    && terraform plan \
    && terraform apply -auto-approve
```
