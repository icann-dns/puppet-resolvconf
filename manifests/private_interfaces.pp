#
#
class resolvconf::private_interfaces (
  $base_order = '70',
  $conf_file  = $::resolvconf::conf_file
){
  $order_end = $base_order + 9
  concat::fragment{'/etc/resolvconf.conf.private_interfaces-begin':
    target  => $conf_file,
    order   => $base_order,
    content => 'private_interfaces="',
  }
  concat::fragment{'/etc/resolvconf.conf.private_interfaces-end':
    target  => $conf_file,
    order   => $order_end,
    content => "\"\n",
  }
}
