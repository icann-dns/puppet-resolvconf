#
#
class resolvconf::search_domains_append (
  $base_order = '40',
  $conf_file  = $::resolvconf::conf_file
){
  $order_end = $base_order + 9
  concat::fragment{'/etc/resolvconf.conf.search_domains_append-begin':
    target  => $conf_file,
    order   => $base_order,
    content => 'search_domains_append="',
  }
  concat::fragment{'/etc/resolvconf.conf.search_domains_append-end':
    target  => $conf_file,
    order   => $order_end,
    content => "\"\n",
  }
}
