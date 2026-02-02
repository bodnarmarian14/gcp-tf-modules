module "custom_network" {
  source       = "./modules/gcp-network"
  project_id   = "my-cloud-project"
  network_name = "dev-vpc"

  subnets = [
    { name = "web-subnet", region = "us-central1", cidr = "10.0.1.0/24" },
    { name = "db-subnet",  region = "us-central1", cidr = "10.0.2.0/24" }
  ]

  firewall_rules = [
    {
      name          = "allow-http"
      source_ranges = ["0.0.0.0/0"]
      allow         = [{ protocol = "tcp", ports = ["80", "443"] }]
    },
    {
      name          = "internal-only"
      source_ranges = ["10.0.0.0/8"]
      allow         = [{ protocol = "icmp" }]
    }
  ]
}