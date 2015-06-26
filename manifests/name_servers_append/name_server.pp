#
#
define resolvconf::name_servers_append::name_server {
  $order = $::resolvconf::name_servers_append::base_order + 5
  concat::fragment{ "/etc/resolvconf.conf.name_servers_append-${name}":
    target  => $::resolvconf::conf_file,
    order   => $order,
    content => " ${name}"
  }
}
