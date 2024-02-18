output sg_id {
  value       = aws_security_group.sg_main.id
}

output rds_security_group {
  value       = aws_security_group.rds_sg.id
}

