SHELL = /usr/bin/env bash -xeuo pipefail

validate:
	@aws cloudformation validate-template \
		--template-body file://sam.yml

deploy:
	@aws cloudformation package \
		--template-file sam.yml \
		--s3-bucket alexa-sampler-sam-artifacts-$$(aws sts get-caller-identity | jq .Account | sed 's/\"//g')-ap-northeast-1 \
		--output-template-file template.yml

	@aws cloudformation deploy \
		--template-file template.yml \
		--stack-name alexa-sampler-functions \
		--capabilities CAPABILITY_IAM \
		--role-arn arn:aws:iam::$$(aws sts get-caller-identity | jq .Account | sed 's/\"//g'):role/alexa-sampler-iam/sam-deploy-role \
		--no-fail-on-empty-changeset

.PHONY: \
	validate \
	deploy
