data "terraform_remote_state" "vm_workloads" {
  backend = "s3"

  config = {
    bucket  = "levizitting-infra-tf-state"
    key     = "vm-workloads/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }

  defaults = {
    cloudflare_tunnel_target = var.x86_public_vps_target
  }
}
