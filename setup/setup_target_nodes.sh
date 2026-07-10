#!/usr/bin/env bash
set -euo pipefail

create_container() {
  local name="$1"
  local addr="$2"

  if sudo lxc info "${name}" >/dev/null 2>&1; then
    echo "Container ${name} already exists. Skip."
    return
  fi

  echo "Creating container ${name} with ${addr}..."

  sudo lxc init ubuntu:24.04 "${name}"
  sudo lxc config device set "${name}" eth0 ipv4.address "${addr}"
  sudo lxc start "${name}"
}

create_container host00 10.200.10.100
create_container host01 10.200.10.101
create_container web00  10.200.10.10
create_container app00  10.200.10.11

sudo lxc list

echo "Target nodes creation completed."
