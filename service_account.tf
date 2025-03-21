resource "yandex_iam_service_account" "bucket" {
  name = "bucket"
}

resource "yandex_resourcemanager_folder_iam_member" "st-editor" {
  folder_id = var.cloud_provider.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.bucket.id}"
}

resource "yandex_iam_service_account_static_access_key" "st-static-key" {
  service_account_id = yandex_iam_service_account.bucket.id
}

resource "yandex_iam_service_account" "vmgroup" {
  name = "vm-group" 
}

resource "yandex_resourcemanager_folder_iam_member" "editor" {
  folder_id  = var.cloud_provider.folder_id
  role       = "editor"
  member     = "serviceAccount:${yandex_iam_service_account.vmgroup.id}"
}