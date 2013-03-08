# = Class: screen::params
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
class screen::params {
  case $::lsbdistcodename {
    'squeeze', 'wheezy', 'precise', 'quantal': {
      $ensure = present
    }
    default: {
      fail("Module ${module_name} does not support ${::lsbdistcodename}")
    }
  }
}
