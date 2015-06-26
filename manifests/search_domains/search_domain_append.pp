#
#
define resolvconf::search_domains_append::search_domain_append {
  $order = $::resolvconf::search_domains_append::base_order + 5
  concat::fragment{ "/etc/resolvconf.conf.search_domains_append-${name}":
    target  => $::resolvconf::conf_file,
    order   => $order,
    content => " ${name}"
  }
}
