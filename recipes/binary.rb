#
# Cookbook Name:: node_exporter
# Recipe:: binary
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

include_recipe 'ark::default'

%w(curl tar bzip2).each do |pkg|
  package pkg
end

dir_name = ::File.basename(node['node_exporter']['dir'])
dir_path = ::File.dirname(node['node_exporter']['dir'])

ark dir_name do
  url node['node_exporter']['binary_url']
  checksum node['node_exporter']['checksum']
  version node['node_exporter']['version']
  prefix_root Chef::Config['file_cache_path']
  path dir_path
  owner node['node_exporter']['user']
  group node['node_exporter']['group']
  extension 'tar.gz'
  action :put
end