locals {
    
}


resource "aws_s3_bucket" "main"{,
    count = var.enabled == true ? 1 : 0

    bucket = var.bucket_name
    bucket_prefix = var.bucket_prefix
    force_destroy       = var.force_destroy

}
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
    bucket= aws_s3_bucket.main.id 

    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "aws:kms"
    }
    } 
}