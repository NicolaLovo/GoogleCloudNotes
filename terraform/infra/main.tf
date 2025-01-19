# Bucket to store website

resource "google_storage_bucket" "website" {
    name = "example-websas"
    location = "US"
    public_access_prevention = "unspecified"

  
}


# Make new objects public

resource "google_storage_object_access_control" "public_rule" {
  object = google_storage_bucket_object.static_site_src.name
  bucket = google_storage_bucket.website.name
  entity = "allUsers"
  role = "READER"

  # role = "READER"
  # entity = "allUsers"
}

# upload index.html to bucket

resource "google_storage_bucket_object" "static_site_src" {
    name = "index.html"
    source = "../website/index.html"
    bucket = google_storage_bucket.website.name
}


# ----------------

resource "google_compute_global_address" "website_ip" {
  name = "website-lb-ip"

}

# get the dns zone since it already exists
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