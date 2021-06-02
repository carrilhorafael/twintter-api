class JsonWebToken
    Secret = "asdasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfavzxcvxzvbxbcvasfgvcbxcvbbxnetd212dasd'12313d12asfg1"
    def self.encode(payload)
        JWT.encode(payload, Secret)    
    end
    def self.decode(token)
        JWT.decode(token, Secret)    
    end
end