#!/bin/bash
# Copyright 2019 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset

# Directories.
SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
OUTPUT_DIR=${OUTPUT_DIR:-${SOURCE_DIR}/../../actual/metal3}

# Binaries
ENVSUBST=${ENVSUBST:-envsubst}
command -v "${ENVSUBST}" >/dev/null 2>&1 || echo -v "Cannot find ${ENVSUBST} in path."

# Cluster.
export CLUSTER_NAME="${CLUSTER_NAME:-test1}"
export KUBERNETES_VERSION="${KUBERNETES_VERSION:-v1.16.2}"

# Machine settings.
export CONTROL_PLANE_MACHINE_TYPE="${CONTROL_PLANE_MACHINE_TYPE:-t2.medium}"
export NODE_MACHINE_TYPE="${CONTROL_PLANE_MACHINE_TYPE:-t2.medium}"
export SSH_KEY_NAME="${SSH_KEY_NAME:-default}"

# Outputs.
COMPONENTS_CLUSTER_API_GENERATED_FILE=${SOURCE_DIR}/provider-components/provider-components-cluster-api.yaml
COMPONENTS_KUBEADM_GENERATED_FILE=${SOURCE_DIR}/provider-components/provider-components-kubeadm.yaml
COMPONENTS_BAREMETAL_GENERATED_FILE=${SOURCE_DIR}/provider-components/provider-components-baremetal.yaml

PROVIDER_COMPONENTS_GENERATED_FILE=${OUTPUT_DIR}/provider-components.yaml
CLUSTER_GENERATED_FILE=${OUTPUT_DIR}/cluster.yaml
CONTROLPLANE_GENERATED_FILE=${OUTPUT_DIR}/controlplane.yaml
MACHINEDEPLOYMENT_GENERATED_FILE=${OUTPUT_DIR}/machinedeployment.yaml
METAL3PLANE_GENERATED_FILE=${OUTPUT_DIR}/metal3plane.yaml

# Overwrite flag.
OVERWRITE=0

SCRIPT=$(basename "$0")
mkdir -p "${OUTPUT_DIR}"

# Generate BAREMETAL Credentials.
export SOME_CREDENTIALS="SOME_CREDENTIALS"
export BAREMETAL_B64ENCODED_CREDENTIAL="$(echo -n "$SOME_CREDENTIALS" | base64 | tr -d '\n')"

# Generate cluster resources.
tools/bin/airshipctl document build "${SOURCE_DIR}/cluster" -o "${CLUSTER_GENERATED_FILE}"
echo "Generated ${CLUSTER_GENERATED_FILE}"

# Generate controlplane resources.
tools/bin/airshipctl document build "${SOURCE_DIR}/controlplane" -o "${CONTROLPLANE_GENERATED_FILE}"
echo "Generated ${CONTROLPLANE_GENERATED_FILE}"

# Generate metal3place resources.
tools/bin/airshipctl document build "${SOURCE_DIR}/metal3plane" -o "${METAL3PLANE_GENERATED_FILE}"
echo "Generated ${METAL3PLANE_GENERATED_FILE}"

# Generate machinedeployment resources.
tools/bin/airshipctl document build "${SOURCE_DIR}/machinedeployment" -o "${MACHINEDEPLOYMENT_GENERATED_FILE}"
echo "Generated ${MACHINEDEPLOYMENT_GENERATED_FILE}"

# Generate Cluster API provider components file.
# tools/bin/airshipctl document build "${SOURCE_DIR}/../../components/capi/default" -o "${COMPONENTS_CLUSTER_API_GENERATED_FILE}"
# echo "Generated ${COMPONENTS_CLUSTER_API_GENERATED_FILE}"

# Generate BAREMETAL Infrastructure Provider components file.
# tools/bin/airshipctl document build "${SOURCE_DIR}/../../components/capbm/default" -o "${COMPONENTS_BAREMETAL_GENERATED_FILE}"
# echo "Generated ${COMPONENTS_BAREMETAL_GENERATED_FILE}"

# Generate a single provider components file.
tools/bin/airshipctl document build "${SOURCE_DIR}/provider-components" -o "${PROVIDER_COMPONENTS_GENERATED_FILE}"
echo "Generated ${PROVIDER_COMPONENTS_GENERATED_FILE}"
