#
#
class resolvconf::params {
  $conf_file      = '/etc/resolvconf.conf'
  $resolvconf_bin = '/sbin/resolvconf'
  $nameservers    = []
}
