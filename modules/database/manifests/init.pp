class database {

	$www_ip = hiera('www_ip')
	
	include '::mysql::server'

	mysql::db { 'mydb':

		user => 'root',

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

}
