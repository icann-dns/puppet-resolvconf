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
class resolvconf {
  file {'/etc/resolvconf.conf':
    ensure  => present,
    content => template('resolvconf/etc/resolvconf.conf.erb'),
  }
  exec { '/sbin/resolvconf -u':
    refreshonly => true,
    subscribe   => File['/etc/resolvconf.conf'],
  }
}
