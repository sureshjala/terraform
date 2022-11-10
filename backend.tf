terraform {
  backend "s3" {
    bucket         = "mybucketsuresh11"
    key            = "LockID"
    region         = "us-west-2"
    dynamodb_table = "mydbsuresh"
  }
}