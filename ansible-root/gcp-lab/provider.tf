#pecify the provider (GCP, AWS, Azure)
provider "google" {
  credentials = "${file("key.json")}"
  project     = "thermal-rock-223700"
  region      = "us-east1-b"
}
