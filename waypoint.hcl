project = "example-nodejs"

app "example-nodejs" {

  build {
    use "pack" {}
    registry {
      use "docker" {
        image = "europe-north1-docker.pkg.dev/service-cluster-330813/nodejs-example/nodejs-example"
        tag   = "latest"
      }
    }
  }

  deploy {
    use "nomad" {
      // these options both default to the values shown, but are left here to
      // show they are configurable
      datacenter = "europe-north1"
      namespace  = "default"

      service_port = 3000
      replicas     = 1
    }
  }
}
