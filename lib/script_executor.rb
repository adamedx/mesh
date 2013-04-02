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
    @last_error_output = nil
  end

  attr_accessor :last_error_output

  def run_script(script_name, command_line_arguments = nil, library_command = nil)

    script_spec = ".\\#{script_name}"
    
    run_powershell_command(nil, script_spec, command_line_arguments, library_command)
    
  end

  def run_command(session_id, command_name, command_line_arguments = nil, library_command = nil)
    
    if ( session_id.nil? )
      raise "Invalid session id"
    end
    
    run_powershell_command(session_id, command_name, command_line_arguments, library_command)
  end

  private
  
  def run_powershell_command(session_id, command_spec, command_line_arguments = nil, library_command = nil)
    
    @last_error_output = nil
    
    load_commands = "cd '#{@current_dir}'"
    
    if ! library_command.nil?
      load_commands = load_commands + ";#{library_command}"
    end
    
    arguments = (command_line_arguments.nil? ? '' : command_line_arguments)

    if ( ! session_id.nil? )
      arguments = "'" + session_id + "' " + arguments
    end
    
    command_line = "powershell -noninteractive -noprofile -command \"#{load_commands};#{command_spec} #{arguments}\""

    `echo #{command_line} > %userprofile%\\commandline.txt`
    
    command = Mixlib::ShellOut.new(command_line)
    result = command.run_command
    return_value = result.stdout
    @last_error_output = result.stderr
    exitstatus = result.exitstatus

    # || @last_error_output.length > 0
    if exitstatus != 0 
      raise "Command #{command_line} failed with error status #{exitstatus}\n#{@last_error_output}"
    end

    return_value
  end
  
end

