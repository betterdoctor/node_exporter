node_exporter Cookbook
======================
This cookbook will install the node_exporter and startup scripts on your server.

Requirements
------------
- Chef 12 or higher

Platform
--------
Tested on

* Ubuntu 14.04
* Ubuntu 16.04

Attributes and Usage
--------------------
The usage instructions and default values for attributes can be found in the attribute file.

Dependencies
------------
ark
compat_resource
runit

License & Authors
------

- Steve Best <thestevebest@gmail.com>
- BetterDoctor SysOps <ops@betterdoctor.com>

```text
Licensed under the Apache License, Version 2.0 (the “License”);
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an “AS IS” BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

[ark]: https://github.com/burtlo/ark
[build-essential]: https://github.com/opscode-cookbooks/build-essential
[runit]: https://github.com/hw-cookbooks/runit
[node_exporter]: https://github.com/prometheus/node_exporter
