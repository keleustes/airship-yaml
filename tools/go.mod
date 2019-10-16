module opendev.org/airship/airship-yaml/tools

go 1.13

require (
	github.com/instrumenta/kubeval v0.0.0-20190918223246-8d013ec9fc56
	opendev.org/airship/airshipctl v0.0.0
	sigs.k8s.io/kind v0.5.1
)

replace (
	github.com/Azure/go-autorest => github.com/Azure/go-autorest v12.0.0+incompatible
	github.com/Azure/go-autorest/autorest => github.com/Azure/go-autorest v13.0.1-0.20190815170712-85d9c035382e+incompatible
	github.com/Azure/go-autorest/autorest/adal => github.com/Azure/go-autorest v13.0.1-0.20190816223009-243e2a3d5e75+incompatible
	github.com/Azure/go-autorest/autorest/date => github.com/Azure/go-autorest v13.0.1-0.20190816215130-5bd9621f41a0+incompatible
	github.com/Azure/go-autorest/autorest/mocks => github.com/Azure/go-autorest v13.0.1-0.20190816215130-5bd9621f41a0+incompatible

	github.com/Sirupsen/logrus => github.com/sirupsen/logrus v1.4.1

	github.com/argoproj/argo => github.com/keleustes/argo v1.16.4
	github.com/colinmarc/hdfs => github.com/colinmarc/hdfs v0.0.0-20180802165501-48eb8d6c34a9
	github.com/ghodss/yaml => github.com/ghodss/yaml v0.0.0-20180820084758-c7ce16629ff4

	k8s.io/api => k8s.io/api v0.0.0-20191003000013-35e20aa79eb8
	k8s.io/apiextensions-apiserver => k8s.io/apiextensions-apiserver v0.0.0-20191003002041-49e3d608220c
	k8s.io/apimachinery => k8s.io/apimachinery v0.0.0-20190913080033-27d36303b655
	k8s.io/apiserver => k8s.io/apiserver v0.0.0-20191003001037-3c8b233e046c
	k8s.io/cli-runtime => k8s.io/cli-runtime v0.0.0-20191003002408-6e42c232ac7d
	k8s.io/client-go => k8s.io/client-go v0.0.0-20191003000419-f68efa97b39e
	k8s.io/cloud-provider => k8s.io/cloud-provider v0.0.0-20191003003426-b4b1f434fead
	k8s.io/cluster-bootstrap => k8s.io/cluster-bootstrap v0.0.0-20191003003255-c493acd9e2ff
	k8s.io/code-generator => k8s.io/code-generator v0.0.0-20190927045949-f81bca4f5e85
	k8s.io/component-base => k8s.io/component-base v0.0.0-20191003000551-f573d376509c
	k8s.io/cri-api => k8s.io/cri-api v0.0.0-20190828162817-608eb1dad4ac
	k8s.io/csi-translation-lib => k8s.io/csi-translation-lib v0.0.0-20191003003551-0eecdcdcc049
	k8s.io/helm => github.com/keleustes/helm v1.16.4
	k8s.io/kube-aggregator => k8s.io/kube-aggregator v0.0.0-20191003001317-a019a9d85a86
	k8s.io/kube-controller-manager => k8s.io/kube-controller-manager v0.0.0-20191003003129-09316795c0dd
	k8s.io/kube-proxy => k8s.io/kube-proxy v0.0.0-20191003002707-f6b7b0f55cc0
	k8s.io/kube-scheduler => k8s.io/kube-scheduler v0.0.0-20191003003001-314f0beee0a9
	k8s.io/kubectl => k8s.io/kubectl v0.0.0-20191003004222-1f3c0cd90ca9
	k8s.io/kubelet => k8s.io/kubelet v0.0.0-20191003002833-e367e4712542
	k8s.io/legacy-cloud-providers => k8s.io/legacy-cloud-providers v0.0.0-20191003003732-7d49cdad1c12
	k8s.io/metrics => k8s.io/metrics v0.0.0-20191003002233-837aead57baf
	k8s.io/sample-apiserver => k8s.io/sample-apiserver v0.0.0-20191003001538-80f33ca02582

	opendev.org/airship/airshipctl => github.com/keleustes/airshipctl v1.16.14

	sigs.k8s.io/cluster-api => github.com/keleustes/cluster-api v1.16.13
	sigs.k8s.io/cluster-api-provider-aws => github.com/keleustes/cluster-api-provider-aws v1.16.13
	sigs.k8s.io/cluster-api-provider-baremetal => github.com/keleustes/cluster-api-provider-baremetal v1.16.13
	sigs.k8s.io/cluster-api-provider-openstack => github.com/keleustes/cluster-api-provider-openstack v1.16.13
	sigs.k8s.io/controller-runtime => github.com/keleustes/controller-runtime v1.16.2
	sigs.k8s.io/kind => github.com/keleustes/kind v1.16.10
	sigs.k8s.io/kustomize/v3 => github.com/keleustes/kustomize/v3 v3.16.10
)
