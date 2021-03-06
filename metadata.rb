# encoding: UTF-8
#
# Cookbook Name:: ramdisk
# Author:: Xabier de Zuazo (<xabier@onddo.com>)
# Copyright:: Copyright (c) 2014 Onddo Labs, SL. (www.onddo.com)
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name 'ramdisk'
maintainer 'Onddo Labs, SL.'
maintainer_email 'team@onddo.com'
license 'Apache 2.0'
description 'Manage tmpfs RAM disks with Chef'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.0' # WiP

supports 'centos'
supports 'debian'
supports 'fedora'
supports 'freebsd'
supports 'redhat'
supports 'ubuntu'

provides 'ramdisk'

grouping 'ramdisk/options',
         title: 'ramdisk options',
         description: 'RAM disk mount options'

attribute 'ramdisk/options/default',
          display_name: 'ramdisk options default',
          description: 'Minimal default mount options to set.',
          type: 'array',
          required: 'optional',
          default: %w(rw)

attribute 'ramdisk/options/flags',
          display_name: 'ramdisk options flags',
          description:
            'Supported mount flag options: nosuid, noexec, ...',
          type: 'array',
          required: 'optional',
          calculated: true

attribute 'ramdisk/options/variables',
          display_name: 'ramdisk options variables',
          description:
            'Supported mount variable options: size=, mode=, uid=, ...',
          type: 'array',
          required: 'optional',
          calculated: true

grouping 'ramdisk/supports',
         title: 'ramdisk supports',
         description: 'RAM disk supported mount operations'

attribute 'ramdisk/supports/remount',
          display_name: 'ramdisk supports remount',
          description: 'Whether mount remount operation is supported',
          type: 'string',
          choice: %w(true false),
          required: 'optional',
          calculated: true
