#
#
define resolvconf::nameservers::nameserver {
  $order = $::resolvconf::nameservers::base_order + 5
  concat::fragment{ "/etc/resolvconf.conf.nameserver-${name}":
    target  => $::resolvconf::conf_file,
    order   => $order,
    content => " ${name}"
  }
}
