require 'active_record'

require_relative 'credentials.rb'

class ConnectionHandler
    attr_accessor :config_hash
    attr_accessor :connection

    def initialize(config_hash)
        self.config_hash = config_hash
        self.connection = createConnection()
    end

    def createConnection()
        self.config_hash = self.config_hash.merge({username: USERNAME, password: PASSWORD})

        return ActiveRecord::Base.establish_connection(self.config_hash).connection
    end

    def executeQuery(sqlQuery)
        self.connection.execute(sqlQuery)
    end
end