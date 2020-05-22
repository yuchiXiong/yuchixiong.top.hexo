---
title: Rails和HTTP422那点事儿
date: 2020-05-22 20:37:00
tags: 
  - Rails
categories:
  - Rails踩坑记录
---
# 1. 问题描述
用 `Ruby on Rails` 开发点接口的时候遇到了HTTP422问题。回去看了眼公司的项目，发现在 `environments` 里写了一句这个：
~~~ ruby
config.action_controller.allow_forgery_protection = false
~~~
参考了一下 `Ruby on Rails` 文档中对于 `csrf` 的描述：
> 默认情况下，Rails 自带的非侵入式脚本适配器会在每个非 GET Ajax 调用中添加名为 X-CSRF-Token 的首部，其值为安全令牌。如果没有这个首部，Rails 不会接受非 GET Ajax 请求。使用其他库调用 Ajax 时，同样要在默认首部中添加 X-CSRF-Token。要想获取令牌，请查看应用视图中由 <%= csrf_meta_tags %> 这行代码生成的 <meta name='csrf-token' content='THE-TOKEN'> 标签。
除了指定的接口外，都需要认证。
> ——[Ruby on Rails 安全指南](https://ruby-china.github.io/rails-guides/security.html#csrf-countermeasures)

上述配置是非常不推荐的。

# 2. 解决方案
## 2.1 使用 `ActionController::Base` 时的细节
该问题通常可能出现在使用 `ActionController::Base` 作为 `Controller` 处理器，但却自己构建了请求的场景。正如上述文档提供的描述，我们应该在表单中构建对应的字段传递 `X-CSRF-Token` 作为请求头来规避该问题。
如果你实在希望关闭该机制，也可以使用如下黑名单的方式来对使指定的接口跳过认证：
~~~ ruby
protect_from_forgery :except => :actions
~~~
或者使用白名单方式来限定需要认证的接口：
~~~ ruby
protect_from_forgery :only=> :actions
~~~
## 2.2 使用 `ActionController::API` 
虽然说来可能有点可笑，但确实存在部分仅提供 `API` 的应用还在使用 `ActionController::Base` 作为基类，这样会带来一些无意义的损耗，您应该将其进行替换：
~~~ ruby
class ApiController < ActionController::API
end
~~~