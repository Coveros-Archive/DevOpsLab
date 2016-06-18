class database {

	$www_ip = hiera('www_ip')
	
	include '::mysql::server'

	mysql::db { 'coveros':

		user => 'user1',

		password => 'test123',

		host => "${www_ip}",

		grant => ['SELECT', 'UPDATE'],

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
		mode => '0644',
		notify => Exec['run_my_script'],

	}

exec {'run_my_script':
     path => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin',
     command => '/usr/local/bin/my_bash_script.sh',
     refreshonly => true,
	}

}
