# Bucket to store website

resource "google_storage_bucket" "website" {
  name                     = "example-websas"
  location                 = "US"
  public_access_prevention = "unspecified"


}


# Make new objects public

resource "google_storage_object_access_control" "public_rule" {
  object = google_storage_bucket_object.static_site_src.name
  bucket = google_storage_bucket.website.name
  entity = "allUsers"
  role   = "READER"

  # role = "READER"
  # entity = "allUsers"
}

# upload index.html to bucket

resource "google_storage_bucket_object" "static_site_src" {
  name   = "index.html"
  source = "../website/index.html"
  bucket = google_storage_bucket.website.name
}


# ----------------
/*
resource "google_compute_global_address" "website_ip" {
  name = "website-lb-ip"

}

# get the dns zone since it already exists in gcp
data "google_dns_managed_zone" "dns_zone" {
  name = "my-dns-zone"
}

# add IP to dns 
resource "google_dns_record_set" "website" {
    name = "website.${data.google_dns_managed_zone.dns_zone.dns_name}"
    type = "A"
    ttl = 300
    managed_zone = data.google_dns_managed_zone.dns_zone
    rrdatas = [ google_compute_global_address.website_ip.address ]
}

# Add the bucket as a CDN backend

resource "google_compute_backend_bucket" "website-backend" {
  name = "website-backend"
  bucket_name = google_storage_bucket.website.name
  description = "Contains files needed for the website"
  enable_cdn = true
}

# gcp url map

resource "google_compute_url_map" "website" {
  name = "website-url-map"
  default_service = google_compute_backend_bucket.website-backend.self_link
  host_rule {
    hosts = ["*"]
    path_matcher = "allpaths"
  }
  path_matcher {
    name = "allpaths"
    default_service = google_compute_backend_bucket.website-backend.self_link
  }
}

# gcp http proxy

resource "google_compute_target_http_proxy" "website" {
  name = "website-proxy"
  url_map = google_compute_url_map.website.self_link
}

# gcp forwarding rule
resource "google_compute_global_forwarding_rule" "default" {
  name = "website-forwarding-rule"
  load_balancing_scheme = "EXTERNAL"
  ip_address = google_compute_global_address.website_ip.address
  ip_protocol = "TCP"
  port_range = "80"
  target = google_compute_target_http_proxy.website.self_link
}

*/