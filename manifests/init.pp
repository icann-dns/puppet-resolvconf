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
  $conf_file      = $::resolvconf::params::conf_file,
  $resolvconf_bin = $::resolvconf::params::resolvconf_bin,
  $nameservers    = $::resolvconf::params::nameservers
) inherits resolvconf::params {
  validate_absolute_path($conf_file)
  validate_absolute_path($resolvconf_bin)
  validate_array($nameservers)

  concat {$conf_file: }
  concat::fragment{'/etc/resolvconf.conf.head':
    target  => $conf_file,
    order   => '01',
    content => '# Managed by puppet',
  }
  concat::fragment{'/etc/resolvconf.conf.nameserver-begin':
    target  => $conf_file,
    order   => '10',
    content => 'name_servers="',
  }
  resolvconf::nameserver{ $nameservers: }
  concat::fragment{'/etc/resolvconf.conf.nameserver-end':
    target  => $conf_file,
    order   => '19',
    content => '"\n',
  }
  exec { "${resolvconf_bin} -u":
    refreshonly => true,
    subscribe   => Concat[$conf_file],
  }
}
