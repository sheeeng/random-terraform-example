default: init


tools:
	@echo "==> installing required tooling..."
	go install github.com/terraform-docs/terraform-docs@v0.16.0

documentation:
	terraform-docs markdown "$(CURDIR)" --output-file README.md

graph:
	@sh -c "'$(CURDIR)/scripts/terraform-graph.sh'"

clean:
	rm --recursive .terraform

init:
	terraform init \
		-input=false \
		-lock-timeout=0s \
		-lock=true \
		-lockfile=readonly \
		-no-color

fmt: init
	terraform fmt \
		-recursive . \
	&& terraform fmt \
		-check \
		-diff \
		-list=true \
		-recursive \
		-write=false

fmt-only:
	terraform fmt \
		-recursive . \
	&& terraform fmt \
		-check \
		-diff \
		-list=true \
		-recursive \
		-write=false

validate: fmt
	terraform validate \
		-no-color

validate-only:
	terraform validate \
		-no-color

providers-lock: validate
	terraform providers lock \
		-platform=windows_amd64 \
		-platform=darwin_amd64 \
		-platform=linux_amd64

plan: validate
	terraform plan \
		-input=false \
		-out=tfplan

plan-only:
	terraform plan \
		-input=false \
		-out=tfplan

apply: plan
	terraform apply \
		-auto-approve \
		-input=false \
		tfplan

.PHONY: \
	build \
	documentation \
	fmt \
	fmt-only \
	graph \
	init \
	tools \
	validate \
	validate-only \
	plan \
	plan-only \
	apply \
	apply-only
