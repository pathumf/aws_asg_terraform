module "green-deployment" {
  source = "/var/lib/jenkins/jobs/OneAppMiddlewareBuild/workspace/proitzen_terraform/"
  lg_name = "green-lg"
  asg_name = "green-asg"
  ag_target = "green-target"
  account_id="727928824050"
}
