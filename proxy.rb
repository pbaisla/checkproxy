require 'net/http'

proxy_addr = ARGV[0]
proxy_port = ARGV[1].to_i
proxy_user = ARGV[2]
proxy_password = ARGV[3]
uri = URI('http://curlmyip.com/')

Net::HTTP.start(uri.host, uri.port, proxy_addr, proxy_port, proxy_user, proxy_password) do |http|
  request = Net::HTTP::Get.new uri
  response = http.request request
  puts response.message
end
