# = Class: screen
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
class screen {
  class { 'screen::package': }
  class { 'screen::config': }
}
