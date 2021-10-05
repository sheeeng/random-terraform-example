# Policies

```bash
terraform fmt -recursive .
sentinel fmt -write=true $(find . -type f -name "*.sentinel")

sentinel test -run=check -verbose
sentinel test -verbose

sentinel test -run=check -verbose $(find . -name "*.sentinel" ! -path "*/testdata/*" ! -path "*/examples/*")
sentinel test -verbose $(find . -name "*.sentinel" ! -path "*/testdata/*" ! -path "*/examples/*")
```
