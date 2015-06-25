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
#      interfaces = hash of interfaces
#      service4 = Service address used for dummy interfaces
#      service6 = Service address used for dummy interfaces
#      beacon4 = Service address used for dummy interfaces
#      beacon6 = Service address used for dummy interfaces
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
  $conf_file      = $::resolvconf::params::conf_file,
  $conf_file_tmpl = $::resolvconf::params::conf_file,
  $resolvconf_bin = $::resolvconf::params::resolvconf_bin,
) inherits resolvconf::params {
  validate_absolute_path($conf_file)
  validate_string($conf_file_tmpl)
  validate_absolute_path($resolvconf_bin)
  file {$conf_file:
    ensure  => present,
    content => template($conf_file_tmpl),
  }
  exec { "${resolvconf_bin} -u":
    refreshonly => true,
    subscribe   => File[$conf_file],
  }
}
