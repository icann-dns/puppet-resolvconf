#
#
define resolvconf::nameserver {
  $conf_file      = $::resolvconf::conf_file
  concat::fragment{"/etc/resolvconf.conf.nameserver-${name}":
    target  => $::resolvconf::conf_file,
    order   => '15',
    content => " ${name}"
  }
}
