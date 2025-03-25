resource "aws_eks_cluster" "eks-cluster" {
  name     = var.cluster-name
  role_arn = aws_iam_role.EKSClusterRole.arn

  vpc_config {
    subnet_ids         = ["subnet-0cd9903ace3ddfed7", "subnet-074299abf51de3c0f"]
    security_group_ids = ["sg-05651e3c5f3d39492"]  # Replace with your security group ID
  }

  version = "1.28"

  depends_on = [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy]
}
