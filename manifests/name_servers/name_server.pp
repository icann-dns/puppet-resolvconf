#
#
define resolvconf::name_servers::name_server {
  $order = $::resolvconf::name_servers::base_order + 5
  concat::fragment{ "/etc/resolvconf.conf.name_servers-${name}":
    target  => $::resolvconf::conf_file,
    order   => $order,
    content => " ${name}"
  }
}
