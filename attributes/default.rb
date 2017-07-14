#
# Cookbook Name:: node_exporter
# Attributes:: default
#

# Directory where the node_exporter binary will be installed
default['node_exporter']['dir']                                                           = '/opt/node_exporter'

# Location of node_exporter binary
default['node_exporter']['binary']                                                        = "#{node['node_exporter']['dir']}/node_exporter"

# Location of node_exporter pid file
default['node_exporter']['pid']                                                           = '/var/run/node_exporter.pid'

# Install method.  Currently only supports binary.
default['node_exporter']['install_method']                                                = 'binary'

# System user to use
default['node_exporter']['user']                                                          = 'node_exporter'

# System group to use
default['node_exporter']['group']                                                         = 'node_exporter'

# Init method.
case node['platform_family']
  when 'debian'
    if node['platform'] == 'ubuntu' && node['platform_version'].to_f < 15.04
      default['node_exporter']['init_style']                                              = 'upstart'
    elsif node['platform'] == 'debian' && node['platform_version'].to_f < 8.0
      default['node_exporter']['init_style']                                              = 'runit'
    else
      default['node_exporter']['init_style']                                              = 'systemd'
    end
  when 'rhel', 'fedora'
    if node['platform_version'].to_i >= 7
      default['node_exporter']['init_style']                                              = 'systemd'
    else
      default['node_exporter']['init_style']                                              = 'init'
    end
  else
    default['node_exporter']['init_style']                                                = 'init'
end

# node_exporter version to build
default['node_exporter']['version']                                                       = '0.14.0'

# Location for node_exporter pre-compiled binary.
default['node_exporter']['binary_url']                                                    = "https://github.com/prometheus/node_exporter/releases/download/v#{node['node_exporter']['version']}/node_exporter-#{node['node_exporter']['version']}.linux-amd64.tar.gz"

# Checksum for pre-compiled binary
default['node_exporter']['checksum']                                                      = 'd5980bf5d0dc7214741b65d3771f08e6f8311c86531ae21c6ffec1d643549b2e'
