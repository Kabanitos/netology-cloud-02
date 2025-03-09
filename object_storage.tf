resource "yandex_storage_bucket" "home_bucket" {
  bucket = var.bucket.bucket
  access_key = yandex_iam_service_account_static_access_key.st-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.st-static-key.secret_key
  max_size = var.bucket.max_size
  default_storage_class = var.bucket.default_storage_class
  anonymous_access_flags {
    read        = true
    list        = true
    config_read = false
  } 
}

resource "yandex_storage_object" "picture" {
  bucket = yandex_storage_bucket.home_bucket.id
  access_key = yandex_iam_service_account_static_access_key.st-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.st-static-key.secret_key
  key    = var.name_picture
  source = "./img/lake.jpg"
}
