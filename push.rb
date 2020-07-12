require 'net/http'

# urls = [
#     'https://www.xiongyuchi.top/', 
#     'https://www.xiongyuchi.top/2020/05/30/javascript-3-bian-liang-zuo-yong-yu-he-nei-cun-wen-ti/',
#     'https://www.xiongyuchi.top/2020/05/23/javascript-2-ji-ben-yu-fa-gai-nian/',
#     'https://www.xiongyuchi.top/2020/05/23/javascript-1-zai-html-zhong-shi-yong-javascript/',
#     'https://www.xiongyuchi.top/2020/05/22/rails-migrate-guan-yu-mysql-lock-de-yi-dian-wen-ti/',
#     'https://www.xiongyuchi.top/2020/05/22/rails-shi-yong-puma-dai-zheng-shu-qi-dong/',
#     'https://www.xiongyuchi.top/2020/05/22/rubymine-zhi-xing-bin-mu-lu-xia-zhi-ling-wu-quan-xian-de-jie-jue-fang-an/',
#     'https://www.xiongyuchi.top/2020/05/22/rails-test-deng-ming-ling-qia-si-chang-yong-de-jie-jue-fang-an/',
#     'https://www.xiongyuchi.top/2020/05/22/rails-he-http422-na-dian-shi-er/',
#     'https://www.xiongyuchi.top/2020/05/22/linux-xia-an-zhuang-ruby/',
# ]

urls = [
    'https://www.xiongyuchi.top/2020/07/12/zhe-ke-neng-shi-zui-quan-zui-xi-jie-de-rails-huan-jing-da-jian-xiang-dao-liao-ji-yu-rvm/',
    'https://www.xiongyuchi.top/2020/06/21/zai-rails-li-shi-yong-mongodb/',
    'https://www.xiongyuchi.top/2020/06/21/node-rsa-yu-ruby-openssl-de-yi-dian-wen-ti/',
    'https://www.xiongyuchi.top/2020/06/17/xiao-qiang-sheng-zhi-ji-yi-ben-bei-ming-zi-dan-ge-de-shi-jian-guan-li-bao-dian/',
    'https://www.xiongyuchi.top/2020/06/15/javascript-6-han-shu-biao-da-shi/',
    'https://www.xiongyuchi.top/2020/06/11/ba-shi-pin-ruby-pa-chong-chu-tan/',
    'https://www.xiongyuchi.top/2020/06/08/javascript-5-mian-xiang-dui-xiang-de-cheng-xu-she-ji/',
    'https://www.xiongyuchi.top/2020/06/04/javascript-4-yin-yong-lei-xing/',
    'https://www.xiongyuchi.top/2020/05/30/javascript-3-bian-liang-zuo-yong-yu-he-nei-cun-wen-ti/',
    'https://www.xiongyuchi.top/about/index.html/',
    'https://www.xiongyuchi.top/2020/05/23/javascript-2-ji-ben-yu-fa-gai-nian/',
    'https://www.xiongyuchi.top/2020/05/23/javascript-1-zai-html-zhong-shi-yong-javascript/',
    'https://www.xiongyuchi.top/2020/05/22/rubymine-zhi-xing-bin-mu-lu-xia-zhi-ling-wu-quan-xian-de-jie-jue-fang-an/',
    'https://www.xiongyuchi.top/2020/05/22/rails-shi-yong-puma-dai-zheng-shu-qi-dong/',
    'https://www.xiongyuchi.top/2020/05/22/rails-he-http422-na-dian-shi-er/',
    'https://www.xiongyuchi.top/2020/05/22/rails-test-deng-ming-ling-qia-si-chang-yong-de-jie-jue-fang-an/',
    'https://www.xiongyuchi.top/2020/05/22/rails-migrate-guan-yu-mysql-lock-de-yi-dian-wen-ti/',
    'https://www.xiongyuchi.top/2020/05/22/linux-xia-an-zhuang-ruby/',
    'https://www.xiongyuchi.top/tags/index.html',
    'https://www.xiongyuchi.top/repository/index.html',
    'https://www.xiongyuchi.top/links/index.html',
    'https://www.xiongyuchi.top/categories/index.html',
    'https://www.xiongyuchi.top/books/index.html',
    'https://www.xiongyuchi.top/404.html'
]

uri = URI.parse('http://data.zz.baidu.com/urls?site=https://www.xiongyuchi.top&token=UaRw3BALTcFXNgeA')

req = Net::HTTP::Post.new(uri.request_uri)

req.body = urls.join("\n")

req.content_type = 'text/plain'

res = Net::HTTP.start(uri.hostname, uri.port) { |http| http.request(req) }

puts res.body