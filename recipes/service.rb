#
# Cookbook Name:: node_exporter
# Recipe:: service
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

case node['node_exporter']['init_style']
  when 'runit'
    include_recipe 'runit::default'

    runit_service 'node_exporter' do
      default_logger true
    end  when 'systemd'

    template '/etc/systemd/system/node_exporter.service' do
      source 'systemd/node_exporter.service.erb'
      mode '0644'
      variables(:sysconfig_file => "/etc/#{conf_dir}/#{env_file}")
      notifies :restart, 'service[node_exporter]', :delayed
    end

    service 'node_exporter' do
      supports :status => true, :restart => true
      action [:enable, :start]
    end

  when 'upstart'
    template '/etc/init/node_exporter.conf' do
      source 'upstart/node_exporter.service.erb'
      mode '0644'
      notifies :restart, 'service[node_exporter]', :delayed
    end

    service 'node_exporter' do
      provider Chef::Provider::Service::Upstart
      action [:enable, :start]
    end
  else
    template '/etc/init.d/node_exporter' do
      source 'node_exporter.erb'
      owner 'root'
      group node['root_group']
      mode '0755'
      notifies :restart, 'service[node_exporter]', :delayed
    end
end

service 'node_exporter' do
  supports :status => true, :restart => true, :reload => true
end
