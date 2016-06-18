class website {

package { 'apache2':

ensure => 'latest',

}


service { 'apache2':

ensure => 'running',

enable => true,

require => Package['apache2'],

}

file { '/var/www/index.html':

ensure => 'absent',

require => Package['apache2'],

}

$greetname = hiera('greetname')

file { '/var/www/index.php':
ensure => 'file',
content => template('website/index.html.erb'),
owner => 'root',
group => 'root',
mode => '0644',
require => File['/var/www/index.html'],

}

}
