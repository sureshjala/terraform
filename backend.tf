terraform {
  backend "s3" {
   key            = "LockID"
    region         = "us-west-2"
    dynamodb_table = "mydbsuresh"
  }
}