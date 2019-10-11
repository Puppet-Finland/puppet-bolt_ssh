# bolt_ssh

Puppet module for managing Puppet Bolt.

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with bolt_ssh](#setup)
    * [What bolt_ssh affects](#what-bolt_ssh-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with bolt_ssh](#beginning-with-bolt_ssh)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

This Puppet module can be used to configure Puppet Bolt controllers and target
hosts so that Bolt can operate over SSH.

## Setup

### What bolt_ssh affects

On Bolt controllers this module manages:

* Puppet Bolt installation from Puppetlabs' puppet-tools-release repositories
* Installing the private SSH key used to connect to target nodes
* Optional features
    * Setting up and keeping a PuppetDB-based inventory up-to-date

On target hosts the following things are managed:

* Adding the public SSH key to the authorized_keys file of the specified user
* Optional features
    * Add sudo rules and wrapper scripts to limit the privileges of the user on target servers

### Setup Requirements

Managing local system users is outside of the scope of this module. This is
because a suitable user may already exist, as in the case of Jenkins slave
process being responsible for running Puppet Bolt command.

### Beginning with bolt_ssh

TODO

## Usage

TODO

## Limitations

There are a couple of limitations:

* Local system users are not managed on the controller or target nodes
* Controller setup is only supported for Debian derivatives; adding support for RedHat or other platforms would be fairly easy.

## Development

Pull requests are welcome.
