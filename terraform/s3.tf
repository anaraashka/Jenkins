resource "random_pet" "petname" {
  length    = 3
  separator = "-"
}


resource "aws_s3_bucket" "dev_bucket" {
  bucket = "development-${random_pet.petname.id}-${data.aws_region.current.id}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::development-${random_pet.petname.id}-${data.aws_region.current.id}/*"
            ]
        }
    ]
}
EOF

  website {
    index_document = "index.html"
    error_document = "error.html"

  }
  force_destroy = true
}

resource "aws_s3_bucket_object" "dev" {
  key          = "index.html"
  bucket       = aws_s3_bucket.dev_bucket.id
  content      = file("../assets/index.html")
  content_type = "text/html"

}

data "aws_region" "current" {}