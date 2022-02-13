resource "aws_s3_bucket" "website" {
  bucket = "hygieia-infra-homepage-prod-website"
  force_destroy = "false"
}

resource "aws_s3_bucket_acl" "website" {
  bucket = aws_s3_bucket.website.id
  acl = "public-read"
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.website.id
  redirect_all_requests_to {
    host_name = "app.virusaas.com"
    protocol = "https"
  }
}

resource "aws_s3_object" "website_content" {
  for_each = fileset("../../src", "*.html")
  bucket = aws_s3_bucket.website.id
  key = each.value
  source = "../../src/${each.value}"
  etag = filemd5("../../src/${each.value}")
  content_type = "text/html"
  acl = "public-read"
}
