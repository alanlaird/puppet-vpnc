class vpnc::params {

  case $operatingsystem {
    'Ubuntu': {
      $init_path = '/etc/init/'
      $init_append = '.conf'
      $init_template = 'vpnc/upstartscript.erb'
      $hasrestart = true
      $hasstatus  = true
    }
    'CentOS': {
      case $operatingsystemmajrelease {
        '6': {
          $init_path = '/etc/init.d/'
          $init_append = ''
          $init_template = 'vpnc/rh_initscript.erb'
          $hasrestart = false
          $hasstatus  = false
        }
        '7': {
          $init_path = '/usr/lib/systemd/system'
          $init_append = ''
          $init_template = 'vpnc/vpnc.service.erb'
          $hasrestart = false
          $hasstatus  = false
        }
      }
    }
    default: {
      $init_path = '/etc/init.d/'
      $init_append = ''
      $init_template = 'vpnc/initscript.erb'
      $hasrestart = false
      $hasstatus  = false
    }
  }
}


