# screen

[![Build Status](https://travis-ci.org/dhoppe/puppet-screen.png?branch=master)](https://travis-ci.org/dhoppe/puppet-screen)
[![Code Coverage](https://coveralls.io/repos/github/dhoppe/puppet-screen/badge.svg?branch=master)](https://coveralls.io/github/dhoppe/puppet-screen)
[![Puppet Forge](https://img.shields.io/puppetforge/v/dhoppe/screen.svg)](https://forge.puppetlabs.com/dhoppe/screen)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/dhoppe/screen.svg)](https://forge.puppetlabs.com/dhoppe/screen)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/dhoppe/screen.svg)](https://forge.puppetlabs.com/dhoppe/screen)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/dhoppe/screen.svg)](https://forge.puppetlabs.com/dhoppe/screen)

#### Table of Contents

1. [Overview](#overview)
1. [Module Description - What the module does and why it is useful](#module-description)
1. [Setup - The basics of getting started with screen](#setup)
    * [What screen affects](#what-screen-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with screen](#beginning-with-screen)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Overview

This module installs and configures the Screen package.

## Module Description

This module handles installing and configuring Screen across a range of
operating systems and distributions.

## Setup

### What screen affects

* screen package.
* screen configuration file.

### Setup Requirements

* Puppet >= 3.0
* Facter >= 1.6
* [Extlib module](https://github.com/voxpupuli/puppet-extlib)
* [Stdlib module](https://github.com/puppetlabs/puppetlabs-stdlib)

### Beginning with screen

Install screen with the default parameters ***(No configuration files will be changed)***.

```puppet
    class { 'screen': }
```

Install screen with the recommended parameters.

```puppet
    class { 'screen':
      config_file_source => 'puppet:///modules/screen/common/etc/screenrc',
    }
```

## Usage

Update the screen package.

```puppet
    class { 'screen':
      package_ensure => 'latest',
    }
```

Remove the screen package.

```puppet
    class { 'screen':
      package_ensure => 'absent',
    }
```

Purge the screen package ***(All configuration files will be removed)***.

```puppet
    class { 'screen':
      package_ensure => 'purged',
    }
```

Deploy the configuration files from source directory.

```puppet
    class { 'screen':
      config_dir_source => 'puppet:///modules/screen/common/etc',
    }
```

Deploy the configuration files from source directory ***(Unmanaged configuration
files will be removed)***.

```puppet
    class { 'screen':
      config_dir_purge  => true,
      config_dir_source => 'puppet:///modules/screen/common/etc',
    }
```

Deploy the configuration file from source.

```puppet
    class { 'screen':
      config_file_source => 'puppet:///modules/screen/common/etc/screenrc',
    }
```

Deploy the configuration file from string.

```puppet
    class { 'screen':
      config_file_string => '# THIS FILE IS MANAGED BY PUPPET',
    }
```

Deploy the configuration file from template.

```puppet
    class { 'screen':
      config_file_template => 'screen/common/etc/screenrc.erb',
    }
```

Deploy the configuration file from custom template ***(Additional parameters can
be defined)***.

```puppet
    class { 'screen':
      config_file_template     => 'screen/common/etc/screenrc.erb',
      config_file_options_hash => {
        'key' => 'value',
      },
    }
```

Deploy additional configuration files from source, string or template.

```puppet
    class { 'screen':
      config_file_hash => {
        'screenrc.2nd' => {
          config_file_path   => '/etc/screenrc.2nd',
          config_file_source => 'puppet:///modules/screen/common/etc/screenrc.2nd',
        },
        'screenrc.3rd' => {
          config_file_path   => '/etc/screenrc.3rd',
          config_file_string => '# THIS FILE IS MANAGED BY PUPPET',
        },
        'screenrc.4th' => {
          config_file_path     => '/etc/screenrc.4th',
          config_file_template => 'screen/common/etc/screenrc.4th.erb',
        },
      },
    }
```

## Reference

### Classes

#### Public Classes

* screen: Main class, includes all other classes.

#### Private Classes

* screen::install: Handles the packages.
* screen::config: Handles the configuration file.

### Parameters

#### `package_ensure`

Determines if the package should be installed. Valid values are 'present', 'latest',
'absent' and 'purged'. Defaults to 'present'.

#### `package_name`

Determines the name of package to manage. Defaults to 'screen'.

#### `package_list`

Determines if additional packages should be managed. Defaults to 'undef'.

#### `config_dir_ensure`

Determines if the configuration directory should be present. Valid values are
'absent' and 'directory'. Defaults to 'directory'.

#### `config_dir_path`

Determines if the configuration directory should be managed. Defaults to '/etc'

#### `config_dir_purge`

Determines if unmanaged configuration files should be removed. Valid values are
'true' and 'false'. Defaults to 'false'.

#### `config_dir_recurse`

Determines if the configuration directory should be recursively managed. Valid
values are 'true' and 'false'. Defaults to 'true'.

#### `config_dir_source`

Determines the source of a configuration directory. Defaults to 'undef'.

#### `config_file_ensure`

Determines if the configuration file should be present. Valid values are 'absent'
and 'present'. Defaults to 'present'.

#### `config_file_path`

Determines if the configuration file should be managed. Defaults to '/etc/screenrc'

#### `config_file_owner`

Determines which user should own the configuration file. Defaults to 'root'.

#### `config_file_group`

Determines which group should own the configuration file. Defaults to 'root'.

#### `config_file_mode`

Determines the desired permissions mode of the configuration file. Defaults to '0644'.

#### `config_file_source`

Determines the source of a configuration file. Defaults to 'undef'.

#### `config_file_string`

Determines the content of a configuration file. Defaults to 'undef'.

#### `config_file_template`

Determines the content of a configuration file. Defaults to 'undef'.

#### `config_file_require`

Determines which package a configuration file depends on. Defaults to 'Package[screen]'.

#### `config_file_hash`

Determines which configuration files should be managed via `screen::define`.
Defaults to '{}'.

#### `config_file_options_hash`

Determines which parameters should be passed to an ERB template. Defaults to '{}'.

## Limitations

This module has been tested on:

* Debian 6/7/8
* Ubuntu 12.04/14.04/16.04

## Development

### Bug Report

If you find a bug, have trouble following the documentation or have a question
about this module - please create an issue.

### Pull Request

If you are able to patch the bug or add the feature yourself - please make a
pull request.

### Contributors

The list of contributors can be found at: [https://github.com/dhoppe/puppet-screen/graphs/contributors](https://github.com/dhoppe/puppet-screen/graphs/contributors)
