# = Class: screen::package
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
class screen::package (
  $ensure = hiera('ensure', $screen::params::ensure),
) inherits screen::params {
  validate_re($ensure, '^(absent|present)$')

  package { 'screen':
    ensure => $ensure,
  }
}
