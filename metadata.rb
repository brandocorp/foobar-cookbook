name             'foobar'
maintainer       'John Doe'
maintainer_email 'john@example.com'
license          'apachev2'
description      'Installs/Configures foobar'
long_description 'Installs/Configures foobar'
version          '0.1.0'

supports 'centos', '>= 5.9'
supports 'redhat', '>= 5.9'

depends 'rhn'

attribute "foobar/home_dir",
  :display_name => "Installation Directory",
  :description => "The location where the foobar application will be installed.",
  :required => "optional",
  :type => "string",
  :default => "/opt/foobar"
