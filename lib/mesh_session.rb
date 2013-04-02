# Manages the Mesh session

require 'script_executor'

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
      arguments = "#{@current_dir} #{@name}"
    else
      throw "Session already open"
    end

    @session_id = @script_executor.run_script('start-session.ps1', arguments, ".\\profile\\mesh-profile.ps1 '#{@current_dir}'")

    return
  end

  def close

    @script_executor.run_script('end-session.ps1', "'#{@session_id}'")

    @session_id = nil
    
    return
  end
  
end
