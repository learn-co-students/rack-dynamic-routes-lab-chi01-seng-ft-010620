class Application 
    
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        
        item_name = req.path.split("/items/").last
        item = Item.find_by_name(item_name)

        if item

            resp.write item.price
        elsif req.path.match(/items/)
            resp.status = 400
            resp.write "Item not found"
        else 
            resp.status = 404
            resp.write "Route not found"
        end
        resp.finish
    end
end
