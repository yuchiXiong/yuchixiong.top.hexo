---
title: Rails使用puma带证书启动
date: 2020-05-22 21:22:02
tags:
  - Rails
---
# 1. 问题描述
不常见的场景，偶尔间因为没有 `nginx` 服务器可以用，但又需要测试 `https` ，因此使用这种方式来带证书启动。

# 2. 解决方案
~~~ shell
rails s puma -p 3000 -b 'ssl://0.0.0.0:3000?key=config/your_key_file.key&cert=config/your_certificate_file.crt'
~~~