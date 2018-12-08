module Cdh
  module Api

    require 'json'
    require 'uri'
    require 'base64'

    def rest_call(server, method, url, body= nil)
      begin
        http = Net::HTTP.start(server, 7180)
      rescue
        return false
      end
      case method
        when :get then req = Net::HTTP::Get.new(url)
        when :post then req = Net::HTTP::Post.new(url)
        when :put then req = Net::HTTP::Put.new(url)
      end
      req.body = body
      req['content-type']="application/json"
      req.basic_auth(node['cdh']['user'],node['cdh']['pass'])
      response = http.request(req)
    end

  end
end

Chef::Resource.send(:include, Cdh::Api)

