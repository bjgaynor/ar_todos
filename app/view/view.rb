require_relative '../../config/application.rb'

class Display

  def self.list(full_list)
    full_list.each_with_index do |item, index| 
      comp = item.first ? '[X]' : '[ ]'
      puts "#{(index.next)}. #{comp} #{item.last}"
    end
  end
 
  def self.remove_item(item)
    puts "Deleted '#{item}' from your TODO list..."
  end
 
  def self.add_item(item)
    puts "Added '#{item}' to your TODO list..."
  end
 
  def self.complete_item(item)
    puts "Marked '#{item}' as complete..."
  end
end