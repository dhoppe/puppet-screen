# = Class: screen::config
#
# This module manages screen
#
# == Parameters: none
#
# == Actions:
#
# == Requires: see Modulefile
#
# == Sample Usage:
#
class screen::config (
  $ensure = hiera('ensure', $screen::params::ensure),
) inherits screen::params {
  validate_re($ensure, '^(absent|present)$')

  file { '/etc/screenrc':
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/screen/common/etc/screenrc',
    require => Package['screen'],
  }
}
