module github.com/minio/minio-operator

go 1.13

require (
	github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b
	// Pinned to kubernetes-1.16.2
	k8s.io/api v0.0.0-20191016110408-35e52d86657a
	k8s.io/apimachinery v0.0.0-20191004115801-a2eda9f80ab8
	k8s.io/client-go v0.0.0-20191016111102-bec269661e48
)
