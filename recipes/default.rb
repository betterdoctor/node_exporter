#
# Cookbook Name:: node_exporter
# Recipe:: default
#
# Author: Steve Best <thestevebest@gmail.com>
# Author: BetterDoctor SysOps <ops@betterdoctor.com>
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
#
user node['node_exporter']['user'] do
  system true
  shell '/bin/false'
  home node['node_exporter']['dir']
  not_if { node['node_exporter']['use_existing_user'] == true || node['node_exporter']['user'] == 'root' }
end

directory node['node_exporter']['dir'] do
  owner node['node_exporter']['user']
  group node['node_exporter']['group']
  mode '0755'
  recursive true
end

include_recipe 'node_exporter::binary'
include_recipe 'node_exporter::service'