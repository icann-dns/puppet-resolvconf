#
#
class resolvconf::dynamic_order (
  $base_order = '20',
  $conf_file  = $::resolvconf::conf_file
){
  $order_end = $base_order + 9
  concat::fragment{'/etc/resolvconf.conf.dynamic_order-begin':
    target  => $conf_file,
    order   => $base_order,
    content => 'dynamic_order="',
  }
  concat::fragment{'/etc/resolvconf.conf.dynamic_order-end':
    target  => $conf_file,
    order   => $order_end,
    content => "\"\n",
  }
}
