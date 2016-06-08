class selenium {
  file {
    ['/opt/selenium-server', '/usr/local/lib/selenium']:
      ensure => directory,
  }

  package { 'xvfb':
    ensure => latest,
  }
  
  package { "firefox":
    ensure => installed,
  }

  exec { 'download-selenium':
    cwd => '/opt/selenium-server',
    command => 'wget http://selenium-release.storage.googleapis.com/2.53/selenium-server-standalone-2.53.0.jar',
    creates => '/opt/selenium-server/selenium-server-standalone-2.53.0.jar',
	path => ['/usr/bin/env','/usr/bin'],
    require => File['/opt/selenium-server'];
  }
  
file { '/opt/selenium-server/FiftyStates-0.0.1-SNAPSHOT.jar':

content => template('selenium/FiftyStates-0.0.1-SNAPSHOT.jar'),

owner => 'root',

group => 'root',

mode => '0644',


}
  

}