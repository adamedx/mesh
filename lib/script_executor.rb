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

require 'mixlib/shellout'

class ScriptExecutor

  def initialize
    @current_dir = File.dirname(__FILE__)    
  end

  def run_command(script_name, command_line_arguments = nil)
    command_line = "cat " + get_script_path(script_name) + " " + (command_line_arguments.nil? ? '' : command_line_arguments)
    command = Mixlib::ShellOut.new(command_line)
    result = command.run_command
    return_value = result.stdout
    exitstatus = result.exitstatus

    if exitstatus != 0
      raise "Command failed with error status #{exitstatus}"
    end
    
  end

  def get_script_path(script_name)
    File::join(@current_dir,script_name)
  end
  
end

