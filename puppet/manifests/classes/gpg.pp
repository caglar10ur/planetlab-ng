class gpg {

	file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-planetlab":
		owner   => root,
		group   => root,
		mode    => 644,
		source  => "puppet://pl-virtual-16.CS.Princeton.EDU/files/etc/pki/rpm-gpg/RPM-GPG-KEY-planetlab",
	}
}
