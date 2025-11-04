resource "aws_iam_role" "ec2_prometheus_role" {
  name               = "ec2_prometheus_role"
  assume_role_policy = data.aws_iam_policy_document.ec2_trust_policy.json
}

resource "aws_iam_policy" "ec2_describe_instances" {
  name        = "ec2_describe_instances"
  description = "Policy to allow EC2 DescribeInstances"
  policy      = data.aws_iam_policy_document.prometheus_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "ec2_describe_instances_attachment" {
  role       = aws_iam_role.ec2_prometheus_role.name
  policy_arn = aws_iam_policy.ec2_describe_instances.arn
}

resource "aws_iam_instance_profile" "ec2_prometheus_profile" {
  name = "ec2_prometheus_profile"
  role = aws_iam_role.ec2_prometheus_role.name
}
