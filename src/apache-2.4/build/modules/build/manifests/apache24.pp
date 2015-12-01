class build::apache24 {
  require build::apache24::packages
  require build::apache24::supervisor
  require build::apache24::logs

  bash_exec { 'usermod -d /apache/data www-data': }

  bash_exec { 'a2enmod actions': }
  bash_exec { 'a2enmod proxy_fcgi': }
  bash_exec { 'a2enmod vhost_alias': }
  bash_exec { 'a2enmod rewrite': }
  bash_exec { 'a2enmod ssl': }
  bash_exec { 'a2enmod headers': }

  bash_exec { 'rm -rf /var/www': }

  file { '/etc/apache2/sites-enabled/000-default.conf':
    ensure => absent
  }

  file { '/etc/apache2/envvars':
    ensure => present,
    source => 'puppet:///modules/build/etc/apache2/envvars',
    mode => 755
  }

  file { '/etc/apache2/conf-available/security.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/apache2/conf-available/security.conf',
    mode => 644
  }

  file { '/etc/apache2/conf-enabled/security.conf':
    ensure => link,
    target => '/etc/apache2/conf-available/security.conf',
    require => File['/etc/apache2/conf-available/security.conf']
  }

  bash_exec { 'mkdir -p /etc/htpasswd': }
}
