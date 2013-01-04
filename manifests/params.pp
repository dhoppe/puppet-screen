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
    'squeeze', 'wheezy': {
      $ensure = present
    }
    default: {
      fail("Module ${module_name} does not support ${::lsbdistcodename}")
    }
  }
}
