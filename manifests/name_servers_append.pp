#
#
class resolvconf::name_servers_append (
  $base_order = '60',
  $conf_file  = $::resolvconf::conf_file
){
  $order_end = $base_order + 9
  concat::fragment{'/etc/resolvconf.conf.name_servers_append-begin':
    target  => $conf_file,
    order   => $base_order,
    content => 'name_servers_append="',
  }
  concat::fragment{'/etc/resolvconf.conf.name_servers_append-end':
    target  => $conf_file,
    order   => $order_end,
    content => "\"\n",
  }
}
