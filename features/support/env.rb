require 'cucumber'
require 'httparty'
require 'rspec'
require 'pry'

require_relative 'auxiliar'
require_relative 'classes'

World(Classes)
World(Auxiliar)