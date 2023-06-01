# random-terraform-examples

```bash
terraform init -upgrade \
    && terraform init -reconfigure -upgrade \
    && terraform fmt -recursive . \
    && terraform fmt -check \
    && terraform validate . \
    && terraform providers lock \
    -platform=windows_amd64 \
    -platform=darwin_amd64 \
    -platform=linux_amd64

terraform plan \
    && terraform apply -auto-approve
```
