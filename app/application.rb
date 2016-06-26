require 'pry'
class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_to_find = req.path.split("/").last

      if item = @@items.find { |item| item.name == item_to_find }
        resp.write item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end #if
  resp.finish
  end
end
