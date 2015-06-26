#
#
define resolvconf::dynamic_orders::dynamic_order {
  $order = $::resolvconf::dynamic_orders::base_order + 5
  concat::fragment{ "/etc/resolvconf.conf.dynamic_orders-${name}":
    target  => $::resolvconf::conf_file,
    order   => $order,
    content => " ${name}"
  }
}
