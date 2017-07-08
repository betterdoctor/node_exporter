name             'node_exporter'
maintainer       'BetterDoctor SysOps'
maintainer_email 'ops@betterdoctor.com'
license          'Apache 2.0'
description      'Installs node_exporter'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.12'
source_url       'https://github.com/betterdoctor/node_exporter'
issues_url       'https://github.com/betterdoctor/node_exporter/issues'
chef_version     '>= 12.15.25' if respond_to?(:chef_version)

%w(ubuntu debian centos redhat fedora).each do |os|
  supports os
end

depends 'runit', '~> 1.5'
depends 'ark'
depends 'compat_resource'

