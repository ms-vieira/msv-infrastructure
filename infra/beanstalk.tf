resource "aws_elastic_beanstalk_application" "app_beanstalk" {
  name        = var.name
  description = var.description
}

resource "aws_elastic_beanstalk_environment" "env_beanstalk" {
  name                = var.environment
  application         = aws_elastic_beanstalk_application.app_beanstalk.name
  solution_stack_name = "64bit Amazon Linux 2 v3.5.3 running Docker"

setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.machine
  }

setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.max
  }

setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.beanstalk_ec2_profile.name
  }

}

resource "aws_elastic_beanstalk_application_version" "default" {
  depends_on = [
    aws_elastic_beanstalk_environment.env_beanstalk,
    aws_elastic_beanstalk_application.app_beanstalk,
    aws_s3_bucket_object.docker
  ]
  name        = var.environment
  application = var.name
  description = var.description
  bucket      = aws_s3_bucket.beanstalk_deploys.id
  key         = aws_s3_bucket_object.docker.id
}