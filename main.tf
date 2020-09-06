provider "google" {
 project     = "other-project-287906"
 region      = "us-central1"
}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}

// A single Compute Engine instance
resource "google_compute_instance" "default" {
    name         = "abhishek-21046-${random_id.instance_id.hex}"
    machine_type = "f1-micro"
    zone         = "us-central1-a"

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-9"
        }
    }   


    network_interface {
        network = "default"

        access_config {
            // Include this section to give the VM an external ip address
            }
    }

    depends_on = [random_id.instance_id]
}
