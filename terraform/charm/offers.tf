resource "juju_offer" "ceph" {
  depends_on       = [null_resource.juju_wait]
  model_uuid       = var.model_uuid
  application_name = var.app_name
  endpoints        = ["ceph", "radosgw", "mds"]
}
