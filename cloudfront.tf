resource "aws_cloudfront_distribution" "mycloudfront" {
  origin {
    domain_name = "${var.bucket_name}.s3.amazonaws.com"
    origin_id   = "${var.bucket_name}"

    custom_header = {
      name  = "Access-Control-Allow-Origin"
      value = "*"
    }
  }

  origin {
    domain_name = "${var.domain_name}"
    origin_id   = "${var.origin_id}"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"

      origin_ssl_protocols = [
        "TLSv1.1",
        "TLSv1",
        "TLSv1.2",
      ]
    }

    custom_header = {
      name  = "Access-Control-Allow-Origin"
      value = "*"
    }
  }

  custom_error_response {
    error_caching_min_ttl = "0"
    error_code            = "403"
  }

  custom_error_response {
    error_caching_min_ttl = "0"
    error_code            = "500"
  }

  origin {
    domain_name = "${var.domain_name2}"
    origin_id   = "${var.origin_id2}"

    custom_origin_config {
      http_port              = 8091
      https_port             = 443
      origin_protocol_policy = "http-only"

      origin_ssl_protocols = [
        "TLSv1.1",
        "TLSv1",
        "TLSv1.2",
      ]
    }
  }

  origin {
    domain_name = "${var.domain_name3}"
    origin_id   = "${var.origin_id3}"
    origin_path = "/stage"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"

      origin_ssl_protocols = [
        "TLSv1.1",
        "TLSv1",
        "TLSv1.2",
      ]
    }

    custom_header = {
      name  = "tenant"
      value = "IND,94"
    }
  }

  enabled         = true
  is_ipv6_enabled = true
  comment         = "lka cloudfront for api-stage "
  aliases         = ["xxxxxxxxxxxxxxxxxxxxx"]

  ordered_cache_behavior {
    path_pattern     = "/test/hello/*"
    target_origin_id = "${var.origin_id2}"
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    compress         = "false"
    smooth_streaming = "false"

    forwarded_values {
      cookies {
        forward = "none"
      }

      query_string = true
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 36000
    default_ttl            = 36000
    max_ttl                = 36000
  }

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${var.origin_id3}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }

      query_string = true
    }

    viewer_protocol_policy = "https-only"
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0
  }

  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags {
    name        = "stage-cloudfront"
    Environment = "stage"
    Department  = "olo"
    olo         = "stage-cloudfront"
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

resource "aws_route53_record" "mycloudfront-dominosindia_in" {
  zone_id = "xxxxxxxxxxxxx"
  name    = "xxxx.xxxxxxxxxxxx.xxxxxx."
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_cloudfront_distribution.mycloudfront.domain_name}"]
}
