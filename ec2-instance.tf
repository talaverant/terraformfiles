resource "aws_key_pair" "shared_sa_key" {
  key_name   = "tf-controller-managed-sa-shared-key"
  public_key = var.ssh_public_key
  tags = {
    # Good idea to tag your resources
    Name       = "tf-controller-managed-sa-shared-key"
    Owner      = "solution architects"
    Purpose    = "TF controller demo of deployment of an ec2 instance and requirements"
    Deployed   = "tf-controller"
    Repository = "git@github.com:talaverant/terraformfiles.git"
  }
  lifecycle {
    ignore_changes = [public_key]
  }
}

resource "aws_security_group" "tf-controller-ec2-instance-demo-sg" {
  name        = "tf-controller-ec2-instance-demo-sg"
  description = "Allow ec2 instance vpc outbound traffic"
  vpc_id      = module.vpc.vpc_id

  # Allow egress to the internet
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    # Good idea to tag your resources
    Name       = "tf-controller-ec2-instance-demo-sg"
    Owner      = "solution architects"
    Purpose    = "TF controller demo of deployment of an ec2 instance and requirements"
    Deployed   = "tf-controller"
    Repository = "git@github.com:talaverant/terraformfiles.git"
  }
}


resource "aws_instance" "tf-controller-ec2-instance-demo-instance-test" {
  ami                    = data.aws_ami.ubuntu-2004-ami.id
  instance_type          = "t2.micro"
  subnet_id              = module.vpc.public_subnets[0]
  key_name               = aws_key_pair.shared_sa_key.key_name
  vpc_security_group_ids = [aws_security_group.tf-controller-ec2-instance-demo-sg.id]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name       = "tf-controller-ec2-instance-demo-instance"
    Owner      = "solution architects"
    Purpose    = "TF controller demo of deployment of an ec2 instance and requirements"
    Deployed   = "tf-controller"
    Repository = "git@github.com:talaverant/terraformfiles.git"
  }
}

