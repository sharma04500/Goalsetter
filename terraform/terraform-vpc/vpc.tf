resource "aws_cloudformation_stack" "eksvpc" {
  name         = var.cf_name
  template_url = var.stackurl
  tags = merge(
    var.tags, {
      "creator" = "terraform"
    }
  )
}
