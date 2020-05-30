require 'net/http'

urls = [
    'https://xiongyuchi.top/', 
    'https://xiongyuchi.top/2020/05/30/JavaScript-3-%E5%8F%98%E9%87%8F%E3%80%81%E4%BD%9C%E7%94%A8%E5%9F%9F%E5%92%8C%E5%86%85%E5%AD%98%E9%97%AE%E9%A2%98/',
    'https://xiongyuchi.top/2020/05/23/JavaScript-2-%E5%9F%BA%E6%9C%AC%E8%AF%AD%E6%B3%95%E6%A6%82%E5%BF%B5/',
    'https://xiongyuchi.top/2020/05/23/JavaScript-1-%E5%9C%A8HTML%E4%B8%AD%E4%BD%BF%E7%94%A8JavaScript/',
    'https://xiongyuchi.top/2020/05/22/Rails-Migrate%E5%85%B3%E4%BA%8EMySQL-lock%E7%9A%84%E4%B8%80%E7%82%B9%E9%97%AE%E9%A2%98/',
    'https://xiongyuchi.top/2020/05/22/Rails%E4%BD%BF%E7%94%A8puma%E5%B8%A6%E8%AF%81%E4%B9%A6%E5%90%AF%E5%8A%A8/',
    'https://xiongyuchi.top/2020/05/22/RubyMine%E6%89%A7%E8%A1%8Cbin%E7%9B%AE%E5%BD%95%E4%B8%8B%E6%8C%87%E4%BB%A4%E6%97%A0%E6%9D%83%E9%99%90%E7%9A%84%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88/',
    'https://xiongyuchi.top/2020/05/22/Rails-test%E7%AD%89%E5%91%BD%E4%BB%A4%E5%8D%A1%E6%AD%BB%E5%B8%B8%E7%94%A8%E7%9A%84%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88/',
    'https://xiongyuchi.top/2020/05/22/Rails%E5%92%8CHTTP422%E9%82%A3%E7%82%B9%E4%BA%8B%E5%84%BF/',
    'https://xiongyuchi.top/2020/05/22/linux%E4%B8%8B%E5%AE%89%E8%A3%85ruby/',
    'https://xiongyuchi.top/2020/05/22/linux%E4%B8%8B%E5%AE%89%E8%A3%85ruby/'
]

uri = URI.parse('http://data.zz.baidu.com/urls?site=https://www.xiongyuchi.top&token=DvZkCgrHlG96xLwD')

req = Net::HTTP::Post.new(uri.request_uri)

req.body = urls.join("\n")

req.content_type = 'text/plain'

res = Net::HTTP.start(uri.hostname, uri.port) { |http| http.request(req) }

puts res.body