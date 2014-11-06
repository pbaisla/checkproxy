require 'net/http'

Shoes.app title: "Check Proxy", width: 400, height: 300, resizable: false do
  stack margin: 10 do
    flow do
      stack width: 0.4 do
        para "Proxy IP address"
      end
      stack width: 0.4 do
        @proxy_addr = edit_line
      end
    end
    flow do
      stack width: 0.4 do
        para "Proxy port"
      end
      stack width: 0.4 do
        @proxy_port = edit_line
      end
    end
    flow do
      stack width: 0.4 do
        para "Proxy username"
      end
      stack width: 0.4 do
        @proxy_user = edit_line
      end
    end
    flow do
      stack width: 0.4 do
        para "Proxy password"
      end
      stack width: 0.4 do
        @proxy_password = edit_line
      end
    end
    flow do
      stack width: 0.4 do
        para "Check this URL"
      end
      stack width: 0.4 do
        @url = edit_line "http://curlmyip.com"
      end
    end
    flow do
      stack width: 0.4 do
        @push = button "Check"
      end
      stack width: 0.4 do
        @result = para ""
      end
    end
  end

  @push.click do
    uri = URI(@url.text)
    addr = @proxy_addr.text
    port = @proxy_port.text.to_i
    user = @proxy_user.text
    password = @proxy_password.text
    Net::HTTP.start(uri.host, uri.port, addr, port, user, password) do |http|
      request = Net::HTTP::Get.new uri
      response = http.request request
      @result.replace response.message
    end
  end
end
