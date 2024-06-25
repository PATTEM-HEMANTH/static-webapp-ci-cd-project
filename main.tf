provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "jenkins" {
  ami           = "ami-0abcdef1234567890"
  instance_type = "t2.micro"

  tags = {
    Name = "JenkinsServer"
  }
}

resource "aws_eks_cluster" "k8s" {
  name     = "k8s-cluster"
  role_arn = aws_iam_role.k8s.arn

  vpc_config {
    subnet_ids = aws_subnet.main.*.id
  }
}

resource "aws_iam_role" "k8s" {
  name = "eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_subnet" "main" {
  count = 2

  vpc_id     = aws_vpc.main.id
  cidr_block = element(["10.0.1.0/24", "10.0.2.0/24"], count.index)
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main"
  }
}
