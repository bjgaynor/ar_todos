require_relative '../../config/application.rb'

class List < ActiveRecord::Base
	has_many :tasks
end
