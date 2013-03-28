# Manages the Mesh session

require 'script_executor.rb'

class MeshSession
  
  def initialize(name)
    @current_dir = File.dirname(__FILE__)        
    @name = name
    @script_executor = ScriptExecutor.new
    @session_id = nil
  end

  attr_accessor :session_id

  def open

    if @session_id.nil?
      script_name = 'mesh-start.ps1'
      arguments = "#{@current_dir} #{@name}"
    else
      throw "Session already open"
    end

    @session_id = @script_executor.run_script(script_name, arguments, @current_dir)

    return
  end

  def close

    @script_executor.run_script('mesh-close.ps1', "#{@session_id}", @current_dir)

    @session_id = nil
    
    return
  end
  
end
