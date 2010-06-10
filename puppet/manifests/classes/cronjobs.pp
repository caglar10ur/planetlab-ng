class cronjob {

	package { 'crontabs':
		ensure => installed,
	}

	service { crond:
		ensure => running,
		enable => true,
	}

	# Bulletproof puppetd -- if puppetd dies, cron will restart it at
	# the top of the hour. In the unlikely event that cron dies, puppetd
	# will restart it on its next run. We're screwed if both cron and
	# puppetd die, though.
	cron { restart-puppet:
		command => "if [ -e /var/run/puppetd.pid ]; then ps uw -p `cat /var/run/puppetd.pid` | grep -q ' ruby /usr/sbin/puppetd' || (rm /var/run/puppetd.pid; /etc/init.d/puppet start); fi",
		user    => root,
		minute  => 0,
	}
}
