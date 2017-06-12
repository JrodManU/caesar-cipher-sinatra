require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  new_string = ''
  if params['original_string'] && params['shift_number']
    new_string = cipher(params['original_string'], params['shift_number'].to_i)
  end
  erb :game, :locals => { :new_string => new_string }
end

def cipher(string, shift_number)
	new_string = ''
	string.each_char do |char|
		if char.match(/[a-zA-Z]/)
			shift_number.times do
				if char.match(/z/)
					char = 'a'
				elsif char.match(/Z/)
					char = 'A'
				else
					char.next!
				end
			end
		end
		new_string << char
	end
	return new_string
end
