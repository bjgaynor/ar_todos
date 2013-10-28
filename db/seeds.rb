require_relative '../config/application.rb'
require 'faker'

class MakeData
	def self.create!

		1.times do 
			List.create!({ name: Faker::Lorem.word.upcase })
		end

		10.times do
			Task.create!({ list_id:     List.all.sample.id,
                           description: Faker::Lorem.sentence,
                           complete:    [false, false, true].sample })
		end
	end
end