resource "aws_efs_file_system" "goalapp" {
  performance_mode = "generalPurpose"
  throughput_mode  = "elastic"
  encrypted        = false
  # Need to update the lifecycle policy and ec2 ami. look logs of terraform_apply 15th workflow
  tags = merge(
    var.tags, {
      "Name" = "goalapp"
    }
  )

}

resource "aws_efs_mount_target" "mount1" {
  file_system_id = aws_efs_file_system.goalapp.id
  subnet_id      = data.aws_subnet.sub-1.id

  depends_on = [aws_efs_file_system.goalapp]
}

resource "aws_efs_mount_target" "mount2" {
  file_system_id = aws_efs_file_system.goalapp.id
  subnet_id      = data.aws_subnet.sub-2.id

  depends_on = [aws_efs_file_system.goalapp]
}

resource "aws_efs_mount_target" "mount3" {
  file_system_id = aws_efs_file_system.goalapp.id
  subnet_id      = data.aws_subnet.sub-3.id

  depends_on = [aws_efs_file_system.goalapp]
}