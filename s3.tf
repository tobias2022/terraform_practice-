data "aws_iam_policy_document" "default" {
  statement {
    sid = "PublicReadGetObject"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${local.s3_bucket_name}/*"]
  }
}

resource "aws_s3_bucket" "website" {
  bucket        = local.s3_bucket_name
  acl           = "public-read"
  force_destroy = true
  tags          = local.tags

  policy = data.aws_iam_policy_document.default.json

    website {
    index_document = "index.html"
    error_document = "error.html"

    routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
  }
}
