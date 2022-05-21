require "mechanize"
require "nokogiri"

require 'pg'

require_relative 'connection.rb'
require_relative 'utils.rb'

# Creamos conexion apuntando a la base 'supermarket'
connectionHandler = ConnectionHandler.new(DB_CONFIG)

# Ejecutamos query dentro de esa base
connectionHandler.executeQuery('')
