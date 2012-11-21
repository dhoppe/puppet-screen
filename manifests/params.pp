class screen::params {
  case $::lsbdistcodename {
    'squeeze', 'natty': {
    }
    default: {
      fail("Module ${module_name} does not support ${::lsbdistcodename}")
    }
  }
}
