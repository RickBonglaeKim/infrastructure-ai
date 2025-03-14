
resource "aws_cloudfront_origin_access_control" "school_sketch_OAC" {
  name = "school_sketch-${var.environment}"
  origin_access_control_origin_type = "s3"
  signing_behavior = "always"
  signing_protocol = "sigv4"
}


resource "aws_cloudfront_response_headers_policy" "school_sketch_response_header" {
  name = local.response-header-policy-name

  cors_config {
    access_control_allow_credentials = false
    access_control_allow_headers {
      items = ["*"]
    }
    access_control_allow_methods {
      items = ["GET", "HEAD"]
    }
    access_control_allow_origins {
      items = ["*"]
    }
    origin_override = false
  }
}


resource "aws_cloudfront_distribution" "school_sketch" {

  enabled = true

  origin {
    domain_name = aws_s3_bucket.school_sketch.bucket_regional_domain_name
    origin_id = aws_s3_bucket.school_sketch.id
    # Do not use OAI (legacy)
    origin_access_control_id = aws_cloudfront_origin_access_control.school_sketch_OAC.id
  }

  default_cache_behavior {
    allowed_methods = local.default-methods
    cached_methods = local.default-methods
    target_origin_id = aws_s3_bucket.school_sketch.id
    cache_policy_id = local.default-cache-policy
    viewer_protocol_policy = local.default-viewer-policy
    origin_request_policy_id = local.origin-request-policy
    response_headers_policy_id = aws_cloudfront_response_headers_policy.school_sketch_response_header.id
  }

  price_class = local.default-price-class

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations = []
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
    name = local.school-sketch-name
    environment = var.environment
  }

}