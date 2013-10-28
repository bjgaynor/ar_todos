require_relative '../../config/application.rb'

class Task < ActiveRecord::Base
	belongs_to :list
end
