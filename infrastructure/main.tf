provider "aws" {
  access_key = "REPLACE_ACCESS_KEY"
  secret_key = "REPLACE_SECRET_KEY"
  region = "us-east-1"
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "test_lambda" {
  filename         = "/Users/sk33561/Sandbox/aws-lambda-terraform/aws-lambda-terraform.zip"
  function_name    = "SampleFunctionWithTerraform"
  role             = "${aws_iam_role.iam_for_lambda.arn}"
  handler          = "index.get"
  source_code_hash = "${base64sha256(file("/Users/sk33561/Sandbox/aws-lambda-terraform/aws-lambda-terraform.zip"))}"
  runtime          = "nodejs8.10"

  environment {
    variables = {
      foo = "bar"
    }
  }
}
