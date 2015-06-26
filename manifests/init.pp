# == Class: network
#
# Configure Network
#
# === Parameters
#
# Document parameters here.
#
# === Variables
#
# === Examples
#
#  class { network:
#  }
#
# === Authors
#
# John Bond <john.bond@icann.org>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class resolvconf (
  $conf_file             = $::resolvconf::params::conf_file,
  $resolvconf_bin        = $::resolvconf::params::resolvconf_bin,
  $state_dir             = $::resolvconf::params::state_dir,
  $interface_order       = $::resolvconf::params::interface_order,
  $dynamic_order         = $::resolvconf::params::dynamic_order,
  $search_domains        = $::resolvconf::params::search_domains,
  $search_domains_append = $::resolvconf::params::search_domains_append,
  $name_servers          = $::resolvconf::params::name_servers,
  $name_servers_append   = $::resolvconf::params::name_servers_append,
  $private_interfaces    = $::resolvconf::params::private_interfaces,
) inherits resolvconf::params {
  validate_absolute_path($conf_file)
  validate_absolute_path($resolvconf_bin)
  concat {$conf_file: }
  concat::fragment{'/etc/resolvconf.conf.head':
    target  => $conf_file,
    order   => '01',
    content => "# Managed by puppet\n",
  }
  if $interface_order {
    validate_string($interface_order)
    concat::fragment{'/etc/resolvconf.conf-interface_order':
      target  => $conf_file,
      order   => '02',
      content => "interface_order=\"${interface_order}\"\n",
    }
  }
  if $dynamic_order {
    validate_string($dynamic_order)
    concat::fragment{'/etc/resolvconf.conf-dynamic_order':
      target  => $conf_file,
      order   => '03',
      content => "dynamic_order=\"${dynamic_order}\"\n",
    }
  }
  include resolvconf::search_domains
  if $search_domains {
    validate_array($search_domains)
    resolvconf::search_domains::search_domain { $search_domains: }
  }
  include resolvconf::search_domains_append
  if $search_domains_append {
    validate_array($search_domains_append)
    resolvconf::search_domains_append::search_domain { $search_domains_append: }
  }
  include resolvconf::name_servers
  if $name_servers {
    validate_array($name_servers)
    resolvconf::name_servers::name_server { $name_servers: }
  }
  include resolvconf::name_servers_append
  if $name_servers_append {
    validate_array($name_servers_append)
    resolvconf::name_servers_append::name_server { $name_servers_append: }
  }
  include resolvconf::private_interfaces
  if $private_interfaces {
    validate_array($private_interfaces)
    resolvconf::private_interfaces::private_interface { $private_interfaces: }
  }

  exec { "${resolvconf_bin} -u":
    refreshonly => true,
    subscribe   => Concat[$conf_file],
  }
}
