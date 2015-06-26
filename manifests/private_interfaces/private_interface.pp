#
#
define resolvconf::private_interfaces::private_interface {
  $order = $::resolvconf::private_interfaces::base_order + 5
  concat::fragment{ "/etc/resolvconf.conf.private_interfaces-${name}":
    target  => $::resolvconf::conf_file,
    order   => $order,
    content => " ${name}"
  }
}
