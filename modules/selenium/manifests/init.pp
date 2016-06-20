class selenium {
  file {
    ['/opt/selenium-server', '/usr/local/lib/selenium']:
      ensure => directory,
  }
  
  package { 'unzip':
	ensure => installed,
  }
  
  package { 'xfce4':
	ensure => installed;
	}

  
file { '/opt/selenium-server/Selenium.zip':

	content => file('selenium/Selenium.zip'),
	owner => 'root',
	group => 'root',
	mode => '0644',
    require => File['/opt/selenium-server'],
	notify => Exec['unzip_file'],
	
}

exec { 'unzip_file':
	command => 'sudo unzip Selenium.zip',
	cwd => '/opt/selenium-server',
	user => 'root',
    path => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin',
	notify => Exec['run_jar'],
	require => Package['unzip'],
	timeout => 1800,
	refreshonly => true,

	}
	
exec { 'run_jar':
	command     => 'java -jar FiftyStates-0.0.1-SNAPSHOT.jar',
	cwd => '/opt/selenium-server',
    path => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin',
	user => 'root',
	}


}