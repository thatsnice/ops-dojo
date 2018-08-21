
# Some life cycles

All steps include "and test/validate" and "update status in inventory" as appropriate.

## Resource (such as host) life cycle

- Adding a resource
  - Discovery
  - Bootstrap / Configure
    - Get minimal TIC agent working on or on behalf of host/device/whatever
    - Monitoring, alerting, ...
  - Inventory
    - Reconcilliation (returning hardware, new hardware, whatever)
  - Add to resource pool(s) when all health checks green
    - Alert if health checks stay red "too long"

- Retiring a resource
  - Status changed to "failing" or something
  - wait for system to scale up (if necessary) to replace failing resource
  - wait for federation to migrate resource's contents to other members
  - shut down resource

- Upgrading a resource
  - ...

## Service life cycle

- Definition
  - Connect to business model
  - Describe package (where found, how installed, ...)
  - Describe/discover dependencies
- Init
  - Deploy first package
  - Create federation
  - Discover and allocate dependencies
  - Test
  - Connect to dependencies

# Standard TIC agent

# TIC modules


