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
  $interface_orders      = $::resolvconf::params::interface_orders,
  $dynamic_orders        = $::resolvconf::params::dynamic_orders,
  $search_domains        = $::resolvconf::params::search_domains,
  $search_domains_append = $::resolvconf::params::search_domains_append,
  $name_servers          = $::resolvconf::params::name_servers,
  $name_servers_append   = $::resolvconf::params::name_servers_append,
  $private_interfaces    = $::resolvconf::params::private_interfaces,
) inherits resolvconf::params {
  validate_absolute_path($conf_file)
  validate_absolute_path($resolvconf_bin)
  if $interface_orders {
    validate_array($interface_orders)
  }
  if $dynamic_orders {
    validate_array($dynamic_orders)
  }
  if $search_domains {
    validate_array($search_domains)
  }
  if $search_domains_append {
    validate_array($search_domains_append)
  }
  if $nameservers {
    validate_array($nameservers)
    resolvconf::nameservers::nameserver { $name_servers: }
  }
  if $nameservers_append {
    validate_array($nameservers_append)
  }
  if $private_interfaces {
    validate_array($private_interfaces)
  }

  concat {$conf_file: }
  concat::fragment{'/etc/resolvconf.conf.head':
    target  => $conf_file,
    order   => '01',
    content => "# Managed by puppet\n",
  }
  include resolvconf::nameservers
  exec { "${resolvconf_bin} -u":
    refreshonly => true,
    subscribe   => Concat[$conf_file],
  }
}
