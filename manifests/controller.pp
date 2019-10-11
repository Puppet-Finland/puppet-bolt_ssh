# @summary Setup Bolt controller
#
# Configure a node to be able to run Puppet Bolt and run commands or
# tasks on target hosts via SSH. This class does not setup any system
# users.
#
# @example
#   include bolt_ssh::controller
#
class bolt_ssh::controller
(
  String           $user,
  Optional[String] $ssh_private_key_content = undef,
  Optional[String] $ssh_private_key_source = undef,

)
{

  case $::osfamily {
    'Debian': {
      ::apt::source { 'puppet-tools-release':
        comment  => 'Puppet tools release repository',
        location => 'http://apt.puppet.com',
        release  => $::lsbdistcodename,
        repos    => 'puppet-tools',
        key      => {
          id     => '6F6B15509CF8E59E6E469F327F438280EF8D349F',
          server => 'keyserver.ubuntu.com',
        }
      }
    }
  }

  # The root user requires special treatment
  $ssh_dir = $user ? {
    'root'  => '/root/.ssh',
    default => "/home/${user}/.ssh"
  }

  file { "${ssh_dir}/puppet-bolt":
    ensure  => 'present',
    content => $ssh_private_key_content,
    source  => $ssh_private_key_source,
    owner   => $user,
    group   => $user,
    mode    => '0600',
  }
}
