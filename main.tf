terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
    }
  }
}

provider "intersight" {
  apikey    = file("../ApiKey.txt")
  secretkey = "../SecretKey.txt"
  endpoint  = "https://intersight.com"
}

resource "intersight_ntp_policy" "ntp_policy" {
  name        = "tf_cloud_demo1"
  description = "Policy Created using no variables"
  enabled     = true
  ntp_servers = ["1.1.1.1", "2.2.2.2"]
  timezone    = "America/Los_Angeles"
  organization {
    object_type = "organization.Organization"
    selector    = "Name eq 'default'"
  }
  tags {
    key   = "Location"
    value = "San Jose"
  }
  tags {
    key   = "DC"
    value = "LAB"
  }
}