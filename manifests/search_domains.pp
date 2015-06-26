#
#
class resolvconf::search_domains (
  $base_order = '30',
  $conf_file  = $::resolvconf::conf_file
){
  $order_end = $base_order + 9
  concat::fragment{'/etc/resolvconf.conf.search_domains-begin':
    target  => $conf_file,
    order   => $base_order,
    content => 'search_domains="',
  }
  concat::fragment{'/etc/resolvconf.conf.search_domains-end':
    target  => $conf_file,
    order   => $order_end,
    content => "\"\n",
  }
}
