class screen::params {
  case $::lsbdistcodename {
    'wheezy', 'squeeze': {
    }
    default: {
      fail("Module ${module_name} does not support ${::lsbdistcodename}")
    }
  }
}
