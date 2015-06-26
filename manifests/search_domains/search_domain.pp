#
#
define resolvconf::search_domains::search_domain {
  $order = $::resolvconf::search_domains::base_order + 5
  concat::fragment{ "/etc/resolvconf.conf.search_domains-${name}":
    target  => $::resolvconf::conf_file,
    order   => $order,
    content => " ${name}"
  }
}
