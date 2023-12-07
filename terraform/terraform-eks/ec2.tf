resource "aws_instance" "goalinstance" {
    ami = var.ec2_ami
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = data.aws_subnet.sub-2
    tags = merge(
        var.tags, {
            "Name" = var.cf_name
        }
    )
    user_data = "${file("ec2userdata.sh")}"
}