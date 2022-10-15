resource "aws_s3_bucket" "s3_bucket"  {
    bucket = "teja12bt"
    tags = {
            Name        = "first bucket of me"
            Environment = "team1"
    }
}