require 'microsoft_open_data/client'

module MicrosoftOpenData
  
  def self.client(options={})
      MicrosoftOpenData::Client.new(options)
    end

    # Delegate to MicrosoftOpenData::Client.new
    def self.method_missing(method, *args, &block)
      return super unless client.respond_to?(method)
      client.send(method, *args, &block)
    end

    def self.respond_to?(method, include_private=false)
      client.respond_to?(method, include_private) || super(method, include_private)
    end
    
end