class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path == "/items/<ITEM NAME>"
      requested_item = req.params["item"]
      if @@items.include?(requested_item)
      resp.write "#{requested_item} costs ${reqested_item.price}.\n"
      end
    else
      resp.write "Route Not Found"
      resp.status = 404
    end
    resp.finish
  end

end

#   1. Your application should only accept the `/items/<ITEM NAME>` route. Everything else should `404`
#   2. If a user requests `/items/<Item Name>` it should return the price of that item
#   3. IF a user requests an item that you don't have, then return a `400` and an error message
#
# class Application
#
#   @@items = ["Apples","Carrots","Pears"]
#
#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)
#
#     if req.path.match(/items/)
#       @@items.each do |item|
#         resp.write "#{item}\n"
#       end
#     elsif req.path.match(/search/)
#
#       search_term = req.params["q"]
#
#       if @@items.include?(search_term)
#         resp.write "#{search_term} is one of our items"
#       else
#         resp.write "Couldn't find #{search_term}"
#       end
#
#     else
#       resp.write "Path Not Found"
#     end
#
#     resp.finish
#   end
# end
