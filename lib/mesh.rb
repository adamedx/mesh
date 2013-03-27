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

require 'script_executor'

class Mesh

  def initialize
    @script_executor = ScriptExecutor.new
  end

  # Create -- creates a new object instance of a type 
  def Create(type_name, arguments = nil)
    run_command('mesh-create.ps1')
  end
    
  # List -- lists methods on a type or object
  def List(type_name, object_id = nil)
    run_command('mesh-list.ps1')    
  end
  
  # Execute -- calls a class method
  def Execute(type_name, object_id, method, arguments)
    run_command('mesh-execute.ps1')        
  end
  
  # Get -- gets existing object
  def Get(object_id)
    run_command('mesh-get.ps1')            
  end
  
  # Delete?
  def Delete(object_id)
    run_command('mesh-delete.ps1')
  end

  private

  def run_command(script_name)
    @script_executor.run_command(script_name)
  end
  
end

