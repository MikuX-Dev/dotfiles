#!/usr/bin/env bash
nouveau="$(sensors nvme-pci-0200 | rg -o '[0-9.°C]+' | sed -n 4p)"
cannonlake="$(sensors amdgpu-pci-0500 | rg -o '[0-9.°C]+ | tail -n1')"
echo "$cannonlake $nouveau"






