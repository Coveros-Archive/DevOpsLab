class selenium {
  file {
    ['/opt/selenium-server', '/usr/local/lib/selenium']:
      ensure => directory,
  }

  package { 'xvfb':
    ensure => latest,
  }
  
/*  package { "firefox":
    ensure => installed,
  } */
  
  package { 'unzip':
	ensure => latest,
  }
  
  package { 'xfce4':
	ensure => latest;
	}

/*  exec { 'download-selenium':
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
    require => File['/opt/selenium-server'];
}

	exec { 'download-selenium':
    cwd => '/usr/local/',
    command => 'sudo wget https://ftp.mozilla.org/pub/firefox/releases/46.0.1/linux-x86_64/en-US/firefox-46.0.1.tar.bz2',
    creates => '/usr/local/firefox-46.0.1.tar.bz2',
	path => ['/usr/bin/env','/usr/bin'],
    require => File['/opt/selenium-server'];
  }
  
  sudo tar xvjf firefox-46.0.1.tar.bz2

sudo ln -s /usr/local/firefox/firefox /usr/bin/firefox

*/
  
file { '/opt/selenium-server/Selenium.zip':

	content => file('selenium/Selenium.zip'),
	owner => 'root',
	group => 'root',
	mode => '0644',
    require => File['/opt/selenium-server'];
}

exec { 'unzip':
	command     => 'sudo unzip Selenium.zip',
	cwd => '/opt/selenium-server',
	user => 'root',
    require => File['/opt/selenium-server'],
	}
  

}