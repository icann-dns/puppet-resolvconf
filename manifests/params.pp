#
#
class resolvconf::params {
  $conf_file             = '/etc/resolvconf.conf'
  $resolvconf_bin        = '/sbin/resolvconf'
  $state_dir             = '/var/run/resolvconf'
  $interface_order       = 'lo  lo[0-9]*'
  $dynamic_order         = 'tap[0-9]* tun[0-9]* ng[0-9]* vpn vpn[0-9]* ppp[0-9]* ippp[0-9]*'
  $search_domains        = []
  $search_domains_append = []
  $name_servers          = []
  $name_servers_append   = []
  $private_interfaces    = []
}
