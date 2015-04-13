#!/bin/bash

# Copyright 2014 Google Inc. All rights reserved.
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

NUM_MINIONS=4
DISK=./kube/kube.vmdk
GUEST_ID=debian6_64Guest

INSTANCE_PREFIX=suresh-kube
MASTER_TAG="${INSTANCE_PREFIX}-master"
MINION_TAG="${INSTANCE_PREFIX}-minion"

MASTER_NAME="${INSTANCE_PREFIX}-master"
MASTER_MEMORY_MB=1024
MASTER_CPU=1

MINION_NAMES=($(eval echo ${INSTANCE_PREFIX}-minion-{1..${NUM_MINIONS}}))
MINION_IP_RANGES=($(eval echo "10.100.{10..$((NUM_MINIONS+10))}.0/24"))
MINION_MEMORY_MB=2048
MINION_CPU=1

PORTAL_NET="10.100.1.0/24"

# Optional: Install node monitoring.
ENABLE_NODE_MONITORING=true

# Optional: Enable node logging.
ENABLE_NODE_LOGGING=false
LOGGING_DESTINATION=elasticsearch

# Optional: When set to true, Elasticsearch and Kibana will be setup as part of the cluster bring up.
ENABLE_CLUSTER_LOGGING=false
ELASTICSEARCH_LOGGING_REPLICAS=1

# Optional: When set to true, heapster, Influxdb and Grafana will be setup as part of the cluster bring up.
ENABLE_CLUSTER_MONITORING="${KUBE_ENABLE_CLUSTER_MONITORING:-true}"

# Optional: Install cluster DNS.
ENABLE_CLUSTER_DNS=true
DNS_SERVER_IP="10.100.1.254"
DNS_DOMAIN="kubernetes.local"
DNS_REPLICAS=1
