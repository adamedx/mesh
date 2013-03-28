# Author:: Adam Edwards (<adamed@opscode.com>)
# Copyright:: Copyright (c) 2013 Adam Edwards
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
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

def windows?
  !!(RUBY_PLATFORM =~ /mswin|mingw|i386-cygwin|windows/)
end

if windows?
  require 'ruby-wmi'
end

def windows_version_supports_powershell?
  supports_powershell = false
  
  if  windows?
    this_operating_system = WMI::Win32_OperatingSystem.find(:first)
    os_version = this_operating_system.send('Version')

    # The operating system version is a string in the following form
    # that can be split into components based on the '.' delimiter:
    # MajorVersionNumber.MinorVersionNumber.BuildNumber
    os_version_components = os_version.split('.')

    if os_version_components.length < 2
      raise 'WMI returned a Windows version from Win32_OperatingSystem.Version ' +
        'with an unexpected format. The Windows version could not be determined.'
    end

    # Windows 6.1 is Windows Server 2008 R2 so test the major and
    # minor version components
    supports_powershell = os_version_components[0] == '6' && os_version_components[1].to_i > 1
  end

  supports_powershell
end


RSpec.configure do |config|
  config.filter_run :focus => true
  
  config.run_all_when_everything_filtered = true
  
  config.treat_symbols_as_metadata_keys_with_true_values = true
  
  config.filter_run_excluding :windows_only => true unless windows?
  config.filter_run_excluding :windows_default_powershell_only => true unless windows_version_supports_powershell?
end

