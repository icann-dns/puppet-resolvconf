#
#
class resolvconf::name_servers (
  $base_order = '10',
  $conf_file  = $::resolvconf::conf_file
){
  $order_end = $base_order + 9
  concat::fragment{'/etc/resolvconf.conf.name_servers-begin':
    target  => $conf_file,
    order   => $base_order,
    content => 'name_servers="',
  }
  concat::fragment{'/etc/resolvconf.conf.name_servers-end':
    target  => $conf_file,
    order   => $order_end,
    content => "\"\n",
  }
}
