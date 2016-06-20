class database {

	$www_ip = hiera('www_ip')
	include '::mysql::server'
	mysql::db { 'coveros':
		user => 'user1',
		password => 'test123',
		host => "${www_ip}",
		grant => ['SELECT', 'UPDATE'],
 		notify => Exec['run_script'],

	}
	
file { '/home/vagrant/StateTable.txt':
		content => template('database/StateTable.txt'),
		owner => 'root',
		group => 'root',
		mode => '0644',
	}

file { '/home/vagrant/CreateTable.sh':
		content => template('database/CreateTable.sh'),
		owner => 'root',
		group => 'root',
		mode => '0777',
	}

file_line { 'bind_address':
			ensure => present,
			path   => '/etc/mysql/my.cnf',
			line   => 'bind-address = 192.168.33.10',
			match  => '^bind-address = ',
			notify => Exec['mysql_restart'],
		}

exec {'mysql_restart':
	 user => 'root',
     path => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin',
     command => 'sudo service mysql restart',
     cwd => '/home/vagrant',
     timeout => 1800,
     refreshonly => true,
	}

exec {'run_script':
     path => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin',
     cwd => '/home/vagrant',
     command => '/home/vagrant/CreateTable.sh',
	 user => 'root',
     refreshonly => true,

	}

}
