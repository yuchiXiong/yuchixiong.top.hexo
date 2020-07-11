# require 'aliyun/oss'

# END_POINT = 'oss-cn-shanghai.aliyuncs.com'
# AK = 'LTAIrqOg38g6wi0D'
# SK = 'ChTo6cOfpoNvEppfUa1nhotd6VRidN'
# BUCKET = 'yuchi-xiong-blog'

# 1. 打包
# system 'hexo clean && hexo g'
# system 'gulp'

# 2. 初始化OSS客户端
# client = Aliyun::OSS::Client.new(
#   endpoint: END_POINT,
#   access_key_id: AK, access_key_secret: SK)

# 3. 获取OSS文件列表
# bucket = client.get_bucket(BUCKET)
# objects = bucket.list_objects.map { |o| o.key }

# 4. 删除
# result = bucket.batch_delete_objects(objects)
# puts result

# 5. 
# dir = Dir.new('./public')
# dir.each do |file|
#   puts File.exists? file
# end