---
title: JavaScript(5)面向对象的程序设计
date: 2020-06-08 20:48:27
tags:
  - JavaScript
  - 前端
categories:
  - JavaScript高级程序设计
---
# 1. 对象
创建一个对象很简单，我们可以很轻松的为其添加属性和方法。属性在创建时都会有一些特性值，它们定义了属性的行为。

## 1.1 属性类型
在 `JavaScript` 中属性被分为两种：数据属性和访问器属性。

### 1.1.1 数据属性
数据属性中包含了数据值的位置，这个位置可以写入和读取值，它有4个特性：
- `[[Configurable]]`：是否可以被 `delete` 删除属性，是否可以修改属性，是否可以将属性修改为访问器属性等。它的默认值是 `true` 。
- `[[Enumerable]]`：是否可以被 `for-in` 循环返回属性，它的默认值是 `true` 。
- `[[Writeable]]`：是否可以修改该属性的值，默认值为 `true` 。
- `[[Value]]`：该属性的数据，默认值是 `undefined` 。
当需要修改一个数据属性的的特性时，必须使用 `Object.defineProperty()` 方法：
~~~JavaScript
let obj = {}
Object.defineProperty(obj, 'name', {
    writable: false,
    value: 'yuchi'
});

obj.name = 'bubu';

console.log(obj.name);
~~~
上述代码打印 `yuchi` ，且由于该属性的 `writable` 被这设定为 `false` ，因而该值无法被修改，在非严格模式下，上述代码中的修改没有效果；在严格模式下，上述代码会抛出错误。
上述规则同样适用于 'configurable` 特性，但需要注意一点，一旦将一个属性设置为 `configurable: false`， 就不可以再将其设置为 `configurable: true` 了，此时再使用 `Object.defineProperty()` 方法仅能修改 `writable` 属性。

### 1.1.2 访问器属性
访问器属性与数据属性的区别在于它不包含数据值，但它包含一对 `getter/setter` 函数。当访问一个属性的时候，会触发该属性的 `getter` 函数，当修改一个属性的时候，会触发该属性的 `setter` 函数。与数据属性相似，它也有4个属性：
- `[[Configurable]]`：是否可以被 `delete` 删除属性，是否可以修改属性，是否可以将属性修改为访问器属性等。它的默认值是 `true` 。
- `[[Enumerable]]`：是否可以被 `for-in` 循环返回属性，它的默认值是 `true` 。
- `[[Get]]`：读取时调用的函数。
- `[[Set]]`：修改时调用的函数。
相同的，我们依然需要使用 `Object.defineProperty()` 方法来为对象定义访问器属性。
~~~ JavaScript
const data = {
    _name: ''
};

Object.defineProperty(data, 'name', {
    get: function () {
        return this._name
    },
    set: function (val) {
        console.log(`${this._name} -> ${val}`);
        this._name = val;
    }
});

data.name = 'xiaoming';
data.name = 'yuchi';
~~~
如上代码将 `data.name` 定义为访问器属性，并为其遍写了 `getter/setter` 函数，当我们修改其值时，就可以自动打印属性值的变化情况，需要注意，此处无论是 `getter()` 函数返回的 `name` ，还是 `setter()` 修改了 `name` ，都会再度触发 `getter/setter` 函数，因而我们使用下划线来表示只能通过对象方法访问的属性。

## 1.2 定义多属性
## 1.3 读取属性的特性

# 2. 创建对象
## 2.1 工厂模式
## 2.2 构造函数模式
## 2.3 原型模式
## 2.4 组合使用构造函数模式和原型模式
## 2.5 动态原型模式
## 2.6 寄生构造函数模式
## 2.7 稳妥构造函数模式

# 3. 继承

## 3.1 原型链