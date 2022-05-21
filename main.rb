require "mechanize"
require "nokogiri"

require 'pg'
require 'active_record'

require_relative 'credentials'

# mechanize = Mechanize.new

# page = mechanize.get('https://es.wikipedia.org/wiki/Wikipedia:Portada')

# puts page.xpath("//a[contains(@title,'Wikipedia')]")[0].text

# definimos el hash de configuracion de la base
db_config = {
	host: 'localhost',
	adapter: 'postgresql',
	encoding: 'utf-8',
	database: 'supermarket',
	schema_search_path: 'public'
}

db_config = db_config.merge({username: 'postgres', password: PASSWORD})

# establecemos conexion con la base de datos
ActiveRecord::Base.establish_connection(db_config)


# creamos una tabla
class CreateTable < ActiveRecord::Migration[5.0]
    def change
        create_table    :toBuyList

        t.string    :id

        t.text      :product_name

        t.text      :price
    end
end

# creamos una instancia y llamamos a change para crear la tabla
CreateTable.new.change