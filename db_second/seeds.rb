require 'json'

require_relative '../lib/populator_fix.rb'

User.each_find (finish: 100) do |u|

    