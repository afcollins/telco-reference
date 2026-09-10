#!/bin/bash
#core-baseline
#      ran.openshift.io/ztp-deploy-wave: "1"
#      - path: reference-crs/required/other/operator-hub.yaml
#      - path: reference-crs/required/other/catalog-source.yaml
#      - path: reference-crs/required/scheduling/Scheduler.yaml
# We don't want to disable catalog sources for this environment
#1-core-cluster-config-5-0-CatalogSource-redhat-operators-1.yaml \
#1-core-cluster-config-5-0-OperatorHub-cluster-0.yaml \
wave-1() {
for i in \
	1-core-cluster-config-5-0-Scheduler-cluster-2.yaml \
	; do
	oc apply -f extracted-crs/${i}
done
}
#      ran.openshift.io/ztp-deploy-wave: "5"
#      - path: reference-crs/optional/logging/ClusterLogNS.yaml
#      - path: reference-crs/optional/logging/ClusterLogOperGroup.yaml
#      - path: reference-crs/optional/logging/ClusterLogSubscription.yaml
#      - path: reference-crs/optional/logging/ClusterLogOperatorStatus.yaml
#5-core-operator-subs-5-0-Namespace-openshift-logging-0.yaml
#5-core-operator-subs-5-0-Operator-cluster-logging.openshift-logging-3.yaml
#5-core-operator-subs-5-0-Subscription-cluster-logging-2.yaml
#5-core-operator-subs-5-0-OperatorGroup-cluster-logging-1.yaml
#      # - path: reference-crs/optional/cert-manager/certManagerNS.yaml
#      # - path: reference-crs/optional/cert-manager/certManagerOperatorgroup.yaml
#      # - path: reference-crs/optional/cert-manager/certManagerSubscription.yaml
# Skip optional
#      - path: reference-crs/required/networking/sriov/SriovSubscriptionNS.yaml
#      - path: reference-crs/required/networking/sriov/SriovSubscriptionOperGroup.yaml
#      - path: reference-crs/required/networking/sriov/SriovSubscription.yaml
#      - path: reference-crs/required/storage/odf-external/odfNS.yaml
#      - path: reference-crs/required/storage/odf-external/odfOperGroup.yaml
#      - path: reference-crs/required/storage/odf-external/odfSubscription.yaml
#      - path: reference-crs/required/networking/metallb/metallbNS.yaml
#      - path: reference-crs/required/networking/metallb/metallbOperGroup.yaml
#      - path: reference-crs/required/networking/metallb/metallbSubscription.yaml
#      - path: reference-crs/required/scheduling/NROPSubscriptionNS.yaml
#      - path: reference-crs/required/scheduling/NROPSubscriptionOperGroup.yaml
#      - path: reference-crs/required/scheduling/NROPSubscription.yaml
#      - path: reference-crs/required/networking/NMStateNS.yaml
#      - path: reference-crs/required/networking/NMStateOperGroup.yaml
#      - path: reference-crs/required/networking/NMStateSubscription.yaml
wave-5(){
for i in \
	5-core-operator-subs-5-0-Namespace-metallb-system-10.yaml \
	5-core-operator-subs-5-0-Namespace-openshift-nmstate-16.yaml \
	5-core-operator-subs-5-0-Namespace-openshift-numaresources-13.yaml \
	5-core-operator-subs-5-0-Namespace-openshift-sriov-network-operator-4.yaml \
	5-core-operator-subs-5-0-Namespace-openshift-storage-7.yaml \
	5-core-operator-subs-5-0-OperatorGroup-metallb-operator-11.yaml \
	5-core-operator-subs-5-0-OperatorGroup-numaresources-operator-14.yaml \
	5-core-operator-subs-5-0-OperatorGroup-openshift-nmstate-17.yaml \
	5-core-operator-subs-5-0-OperatorGroup-openshift-storage-operatorgroup-8.yaml \
	5-core-operator-subs-5-0-OperatorGroup-sriov-network-operators-5.yaml \
	5-core-operator-subs-5-0-Subscription-kubernetes-nmstate-operator-18.yaml \
	5-core-operator-subs-5-0-Subscription-metallb-operator-sub-12.yaml \
	5-core-operator-subs-5-0-Subscription-numaresources-operator-15.yaml \
	5-core-operator-subs-5-0-Subscription-odf-operator-9.yaml \
	5-core-operator-subs-5-0-Subscription-sriov-network-operator-subscription-6.yaml \
	; do
	oc apply -f extracted-crs/${i}
done
}
#      ran.openshift.io/ztp-deploy-wave: "6"
#      - path: reference-crs/optional/logging/ClusterLogServiceAccount.yaml
#      - path: reference-crs/optional/logging/ClusterLogServiceAccountAuditBinding.yaml
#      - path: reference-crs/optional/logging/ClusterLogServiceAccountInfrastructureBinding.yaml
#      - path: reference-crs/required/networking/sriov/SriovOperatorConfig.yaml
#      - path: reference-crs/required/networking/NMState.yaml
#      - path: reference-crs/optional/networking/firewall/node-disruption-policy.yaml
#      - path: reference-crs/required/scheduling/sched.yaml
#6-core-operator-config-5-0-ServiceAccount-collector-0.yaml \
#6-core-operator-config-5-0-ClusterRoleBinding-logcollector-audit-logs-binding-1.yaml \
#6-core-operator-config-5-0-ClusterRoleBinding-logcollector-infrastructure-logs-binding-2.yaml \
wave-6(){
for i in \
   6-core-operator-config-5-0-SriovOperatorConfig-default-3.yaml \
	6-core-operator-config-5-0-MachineConfiguration-cluster-5.yaml \
	6-core-operator-config-5-0-NMState-nmstate-4.yaml \
	6-core-operator-config-5-0-NUMAResourcesScheduler-numaresourcesscheduler-6.yaml \
	; do
	oc apply -f extracted-crs/${i}
done
}

wave-6
#0-core-upgrade-ocp-5-0-ClusterVersion-version-0.yaml
#0-core-upgrade-olm-5-0-Subscription-cluster-logging-0.yaml
#0-core-upgrade-olm-5-0-Subscription-kubernetes-nmstate-operator-3.yaml
#0-core-upgrade-olm-5-0-Subscription-metallb-operator-sub-4.yaml
#0-core-upgrade-olm-5-0-Subscription-numaresources-operator-5.yaml
#0-core-upgrade-olm-5-0-Subscription-odf-operator-2.yaml
#0-core-upgrade-olm-5-0-Subscription-sriov-network-operator-subscription-1.yaml
#0-core-upgrade-prep-5-0-CatalogSource-redhat-operators-0.yaml
#0-core-upgrade-prep-5-0-MachineConfigPool-worker-1-1.yaml
#0-core-upgrade-prep-5-0-MachineConfigPool-worker-2-2.yaml
#10-config-monitoring-5-0-ConfigMap-cluster-monitoring-config-0.yaml
#200-custom-mcp-unpause-5-0-MachineConfigPool-worker-1-0.yaml
#200-custom-mcp-unpause-5-0-MachineConfigPool-worker-2-1.yaml
#201-core-custom-mcp-set-maxavailable-5-0-MachineConfigPool-worker-1-0.yaml
#201-core-custom-mcp-set-maxavailable-5-0-MachineConfigPool-worker-2-1.yaml
#2-core-overlay-base-5-0-ImageDigestMirrorSet-disconnected-internal-idms-0.yaml
#2-core-overlay-base-5-0-MachineConfig-40-load-kernel-modules-control-plane-3.yaml
#2-core-overlay-base-5-0-MachineConfig-40-load-kernel-modules-worker-2.yaml
#2-core-overlay-base-5-0-MachineConfig-99-worker-setsebool-4.yaml
#2-core-overlay-base-5-0-MachineConfig-load-sctp-module-1.yaml
#8-core-overlay-config-5-0-ClusterLogForwarder-instance-6.yaml
#8-core-overlay-config-5-0-ConfigurationState-controller-8.yaml
#8-core-overlay-config-5-0-KubeletConfig-sizing-master-0.yaml
#8-core-overlay-config-5-0-MetalLB-metallb-7.yaml
#8-core-overlay-config-5-0-Network-cluster-1.yaml
#8-core-overlay-config-5-0-NUMAResourcesOperator-numaresourcesoperator-2.yaml
#8-core-overlay-config-5-0-PerformanceProfile-control-plane-profile-4.yaml
#8-core-overlay-config-5-0-PerformanceProfile-worker-profile-1-3.yaml
#8-core-overlay-config-5-0-Secret-rook-ceph-external-cluster-details-13.yaml
#8-core-overlay-config-5-0-SriovNetworkNodePolicy-intele810-10.yaml
#8-core-overlay-config-5-0-SriovNetworkNodePolicy-intelx710-9.yaml
#8-core-overlay-config-5-0-SriovNetworkNodePolicy-mellanox-cx6-12.yaml
#8-core-overlay-config-5-0-SriovNetwork-sriov-network-signal-1-11.yaml
#8-core-overlay-config-5-0-StorageCluster-ocs-external-storagecluster-14.yaml
#8-core-overlay-config-5-0-Tuned-telco-core-performance-patch-5.yaml
#non-policy-0.yaml
#non-policy-10.yaml
#non-policy-11.yaml
#non-policy-12.yaml
#non-policy-13.yaml
#non-policy-14.yaml
#non-policy-15.yaml
#non-policy-16.yaml
#non-policy-17.yaml
#non-policy-18.yaml
#non-policy-19.yaml
#non-policy-1.yaml
#non-policy-20.yaml
#non-policy-21.yaml
#non-policy-22.yaml
#non-policy-23.yaml
#non-policy-24.yaml
#non-policy-25.yaml
#non-policy-26.yaml
#non-policy-2.yaml
#non-policy-3.yaml
#non-policy-4.yaml
#non-policy-5.yaml
#non-policy-6.yaml
#non-policy-7.yaml
#non-policy-8.yaml
#non-policy-9.yaml
#core-overlay
#      ran.openshift.io/ztp-deploy-wave: "2"
#      - path: reference-crs/required/other/idms.yaml
#              - example.com/sample-path
#              source: nomatch.io/sample-path
#      - path: reference-crs/optional/other/sctp_module_mc.yaml
#      - path: reference-crs/optional/other/worker-load-kernel-modules.yaml
#      - path: reference-crs/optional/other/control-plane-load-kernel-modules.yaml
#      - path: reference-crs/optional/networking/multus/tap_cni/mc_rootless_pods_selinux.yaml
#      # - path: reference-crs/optional/cert-manager/certManagerClusterIssuer.yaml
#      # - path: reference-crs/optional/cert-manager/ingressCertificate.yaml
#      # - path: reference-crs/optional/cert-manager/ingressControllerConfig.yaml
#      # - path: reference-crs/optional/cert-manager/apiServerCertificate.yaml
#      # - path: reference-crs/optional/cert-manager/apiServerConfig.yaml
#      ran.openshift.io/ztp-deploy-wave: "8"
#      - path: reference-crs/optional/tuning/control-plane-system-reserved.yaml
#      - path: reference-crs/required/networking/Network.yaml
#      # - path: reference-crs/optional/networking/networkAttachmentDefinition.yaml
#      - path: reference-crs/required/scheduling/nrop.yaml
#      - path: reference-crs/required/performance/PerformanceProfile.yaml
#      - path: reference-crs/required/performance/PerformanceProfile-control-plane.yaml
#      - path: reference-crs/required/performance/TunedPerformancePatch.yaml
#      - path: reference-crs/optional/logging/ClusterLogForwarder.yaml
#      - path: reference-crs/required/networking/metallb/metallb.yaml
#      - path: reference-crs/required/networking/metallb/configurationstate.yaml
#      - path: reference-crs/required/networking/sriov/sriovNetworkNodePolicy.yaml
#      - path: reference-crs/required/networking/sriov/sriovNetworkNodePolicy.yaml
#      - path: reference-crs/required/networking/sriov/sriovNetwork.yaml
#      - path: reference-crs/required/networking/sriov/sriovNetworkNodePolicy.yaml
#      - path: reference-crs/required/storage/odf-external/01-rook-ceph-external-cluster-details.secret.yaml
#      - path: reference-crs/required/storage/odf-external/02-ocs-external-storagecluster.yaml
#      ran.openshift.io/ztp-deploy-wave: "10"
#      - path: reference-crs/optional/other/monitoring-config-cm.yaml
#                  pathPrefix: "/"
