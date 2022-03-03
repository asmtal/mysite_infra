resource "aws_iam_instance_profile" "ssm_profile" {
  name = "ssm_profile"
  role = aws_iam_role.instance_role.name
}

resource "aws_iam_role" "instance_role" {
  name                = "instance_role"
  assume_role_policy  = data.aws_iam_policy_document.instance_assume_role_policy.json
  managed_policy_arns = [data.aws_iam_policy.ssm_policy.arn]

  tags = {
    Creator = "trraform"
  }
}

data "aws_iam_policy" "ssm_policy" {
  name = "AmazonSSMManagedInstanceCore"
}

data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}
