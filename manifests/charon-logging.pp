# strongSwan charon class.
class strongswan::charon-logging (
  $filelog                = undef,
  $syslog                 = 'yes',
  $identifier             = undef,
  $syslog_facility        = undef,
  $strongswan_subsystem   = undef,
  $ike_name               = undef,
  $default_log_level      = 'undef',


) inherits strongswan::params {

  file { 'charon-logging.conf':
    ensure  => present,
    path    => $strongswan::params::charon_logging_conf,
    content => template("${module_name}/charon-logging.conf.erb"),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Package[$strongswan::params::package],
    notify  => Class['Strongswan::Service'],
  }
}
