resource "aws_security_group" "web_admin" {
  name        = "web_admin"
  description = "Security group for web admin access"
  vpc_id      = var.vpc_id

  # Public SSH ingress rule - added to codify drift
  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "web_admin"
    ManagedBy   = "Terraform"
    Environment = "production"
  }
}
