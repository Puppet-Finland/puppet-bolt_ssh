# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   bolt_ssh::sudocommand { 'namevar': }
define bolt_ssh::sudocommand
(
  String $script_content,
  String $script_basedir = $::bolt_ssh::target::script_basedir,
)
{
  file { "${script_basedir}/${title}":
    ensure  => 'present',
    user    => 'root',
    group   => 'root',
    mode    => '0755',
    require => Class['::bolt_ssh::target'],
  }
}
