provider "aws" {
  region = "us-east-1"
}

data "archive_file" "prepare_lambda_source" {
    type        = "zip"
    source_dir  = "../src"
    output_path = "sample_lambda.zip"
}

# resource "aws_iam_role" "iam_for_lambda" {
#   name = "iam_for_lambda"

#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "lambda.amazonaws.com"
#       },
#       "Effect": "Allow",
#       "Sid": ""
#     }
#   ]
# }
# EOF
# }

resource "aws_lambda_function" "my_lambda" {
  filename = "sample_lambda.zip"
  source_code_hash = "${data.archive_file.prepare_lambda_source.output_base64sha256}"
  function_name = "SampleFunctionWithTerraform"
  role = "${aws_iam_role.iam_for_lambda.arn}"
  description = "Sample AWS lambda with terraform"
  handler = "index.get"
  runtime = "nodejs12.x"
}

