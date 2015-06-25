#
#
class resoveconf::params {
  $conf_file = '/etc/resolvconf.conf'
  $conf_file_tmpl = 'resolvconf/etc/resolvconf.conf.erb'
  $resolvconf_bin = '/sbin/resolvconf'
}
