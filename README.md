AlexaSAMSampler
=======

Deploy Alexa Skill with [AWS SAM](https://github.com/awslabs/serverless-application-model)

# Reference
- [Alexaスキル開発トレーニングシリーズ 第1回 初めてのスキル開発](https://developer.amazon.com/ja/blogs/alexa/post/6e716e5c-55b0-445b-b936-9cfac4712e7b/training-1)

# Requirements

- [AWS CLI](https://aws.amazon.com/cli/)
- [Docker for Mac](https://www.docker.com/docker-mac)
- [yarn](https://yarnpkg.com)

# Deploy

## 1. Configure AWS credentials

- `~/.aws/credentials`

```bash
[alexa-sampler-development]
aws_access_key_id = <your_aws_access_key_id>
aws_secret_access_key = <your_aws_secret_access_key>
```

- `~/.aws/config`

```bash
[profile alexa-sampler-development]
region = ap-northeast-1
output = json
```

## 2. Building Cloud Formation

### Setting

```bash
$ cd cfn
$ yarn install
```

### Docker image build

```bash
$ ./build.sh
```

### Deploy S3

```bash
$ ./run.sh -t s3.yml
```

### Deploy IAM

```bash
$ ./run.sh -t iam.yml
```

## 2. Building AWS SAM

```shell
$ cd AlexaSAMSampler
$ make deploy
```
