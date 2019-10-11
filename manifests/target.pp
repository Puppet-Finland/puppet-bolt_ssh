# @summary setup bolt target node
#
# configure ssh and optionally sudo rules on a Bolt target node
#
# @example
#   include bolt_ssh::target
#
class bolt_ssh::target
(
  String $user,
  String $ssh_public_key,
  String $ssh_public_key_type
)
{
  ssh_authorized_key { 'puppet-bolt.pub':
    ensure => 'present',
    user   => $user,
    type   => $ssh_public_key_type,
    key    => $ssh_public_key,
  }
}
