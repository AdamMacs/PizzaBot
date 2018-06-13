#!/usr/bin/env ruby
require_relative 'lib/input_formatter.rb'

	input = InputFormatter.new(ARGV[0])
	puts PizzaBot.new.delivery_instructions(input.grid, input.drops).join
