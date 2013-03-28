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

require 'mesh_session'

class Mesh

  def self.with_clr
    new_mesh = Mesh.new
    yield new_mesh
  ensure
    new_mesh.send(:release)
  end

  # Create -- creates a new object instance of a type 
  def create(type_name, arguments = nil)
    run_command('mesh-create.ps1')
  end
    
  # List -- lists methods on a type or object
  def list(type_name, object_id = nil)
    run_command('mesh-list.ps1')    
  end
  
  # Execute -- calls a class method
  def execute(type_name, object_id, method, arguments)
    run_command('mesh-execute.ps1')        
  end
  
  # Get -- gets existing object
  def get(object_id)
    run_command('mesh-get.ps1')            
  end
  
  # Delete?
  def delete(object_id)
    run_command('mesh-delete.ps1')
  end

  protected

  def initialize
    process_id = Process.pid
    session_name = "Ruby-Mesh-#{process_id}"
    @script_executor = ScriptExecutor.new
    @session = MeshSession.new(session_name)
    @released = false

  end

  def release
    @session.close
    @session = nil
    @released = true
  end

  private

  def run_command(script_name)
    if @released
      raise "Instance already released"
    end

    if @session.session_id.nil?
      @session.open
    end
    
    @script_executor.run_command(@session.session_id,script_name, ".\\profile\\mesh-profile.ps1")
  end
  
end

