require_relative '../../config/application.rb'
 
class Controller
  def self.run!
    user_command, actionable_data = gets_args
    Commands.run_commands(user_command, actionable_data)
  end
 
  def self.gets_args
    [ARGV.shift.to_sym, ARGV.join(' ')]
  end
end
 
 
class Commands
  def self.run_commands(user_command, actionable_data)
    case user_command
    when :list then list_items
    when :delete then delete_item(actionable_data)
    when :add then add_item(actionable_data)
    when :complete then complete_item(actionable_data)
    end
  end
 
  def self.list_items
  	list = Task.all.map {|t| t.description}
  	comp = Task.all.map {|t| t.complete}
    Display.list(comp.zip(list))
  end
 
  def self.delete_item(item_to_delete)
    deleted_item = Task.find(item_to_delete.to_i - 1).destroy    
    Display.remove_item(deleted_item.description)
  end
 
  def self.add_item(item_to_add)
    Task.create({ description: item_to_add })
    Display.add_item(item_to_add)
  end
 
  def self.complete_item(item_to_complete)
    completed_item = Task.find(item_to_complete.to_i - 1)
    completed_item.complete = true
    completed_item.save
    Display.complete_item(completed_item.description)
  end
end