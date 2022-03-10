provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
  
}

resource "aws_kms_key" "kmss3desarrollo" {
  description             = "KMSkey1"
  deletion_window_in_days = 7
}

resource "aws_s3_bucket" "bucketniubizdesarrollo" {
  bucket = "examplebuckettftest"
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.bucketniubizdesarrollo.id
  acl    = "private"
}

resource "aws_s3_object" "example" {
  key        = "someobject"
  bucket     = aws_s3_bucket.bucketniubizdesarrollo.id
  source     = "index.html"
  kms_key_id = aws_kms_key.kmss3desarrollo.arn
}
