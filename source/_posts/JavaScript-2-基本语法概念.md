---
title: JavaScript(2)基本语法概念
date: 2020-05-23 14:58:15
tags:
  - JavaScript
  - 前端
categories:
  - JavaScript高级程序设计
---
# 1. 语法要点
`JavaScript` 语法借鉴了 `C/Java` ，其语法主要有如下特征
- 严格区分大小写。
- 标识符（变量/函数名/属性/参数）命名允许使用数字/字母/下划线/美元符号，其中数字不能用作命名开头。
- 语句结尾的分号不是必要的，但是**建议在语句结尾使用分号**。

# 2. 变量 
与其它语言相比，`JavaScript` 的变量更加灵活，但并不是所有的特性都应该被使用。
`JavaScript` 的变量是松散类型的，即它可以保存任何类型的数据，因此如下代码是合法的：
~~~ JavaScript
var message = '666';
message = 666;
~~~
`JavaScript` 允许我们修改一个变量的数据类型，但请注意，我们**不提倡这种做法**。
另外一个特性是，当使用 `var` 关键字定义变量时，实则是在当前作用域里定义了一个局部变量。`JavaScript` 允许定义变量时去掉 `var` 关键字，这样的做法会直接定义一个全局变量，同样，我们也**不提倡这种做法**。
~~~ JavaScript
function test() {
    message = 'hi'
}
alert(test());
~~~

# 3. 数据类型
`JavaScript` 中一共定义了5种基本数据类型，它们分别是：`Number`，`String`，`Boolean`，`Null`，`Undefined`。以及一种复杂数据类型 `Object` 。

## 3.1. 如何判断一个变量的数据类型
`JavaScript` 提供了 `typeof` 关键字来检测变量的数据类型。
对于部分值我们很容易得到其对应的结果，就像下面的代码：
~~~ JavaScript
console.log(typeof 666);
console.log(typeof '666');
console.log(typeof true);
console.log(typeof {});
console.log(typeof function(){});
~~~
几乎没有疑问的可以得到输出结果是 `number string boolean object function`。
但对于如下的代码：
~~~ JavaScript
onsole.log(typeof []);
console.log(typeof null);
~~~
其输出结果却是 `object object`。

> 有些时候，typeof 操作符会返回一些令人疑惑但技术上却正确的值。比如，调用 typeof null 会返回 "object"，因为特殊值 null 被认为是一个空的对象引用。
> 《JavaScript高级程序设计》

## 3.2. Undefined
`Undefined` 类型的变量只有 `undefined` 一个值，当一个变量仅声明未赋初值时，它的值就是 `undefined`。
~~~ JavaScript
var msg;
console.log(msg);
~~~
如上代码输出 `undefined`。
> 即便未初始化的变量会自动被赋予undefined值，但显式地初始化变量依然是明知的选择。如果能够做到这一点，那么当typeof操作符返回 "undefined" 值时，我们就知道被检测的变量还没有申明，而不是尚未初始化。
> 《JavaScript高级程序设计》

## 3.3. Null
`Null` 类型的变量和 `Undefined` 一样只有一个值那就是 `null` , `null` 变量存储的实际是一个空指针对象，也正是因为如此， `typeof null` 返回了 `"objcet"`。
当使用 `==` 运算符在判断 `null` 和 `undefined` 时会返回 `true`，因为该操作符会发生隐式转换。
> 只要意在保存对象的变量还没有真正保存对象，就应该明确地让该变量保存null值。这样做不仅可以体现null作为空对象的惯例，而且也有助于进一步区分null和undefined。
> 《JavaScript高级程序设计》

## 3.4. Boolean
`Boolean` 有两个值 `true` 和 `false` ，在 `JavaScript` 中，所有的类型都可以转化为 `Boolean` 值。
~~~ JavaScript
var message = 'hello, world!';
var messageBoolean = Boolean(message);
~~~

## 3.5. Number
`JavaScript` 中的 `Number` 类型与其它语言并没有太大的差异。它的数字返回存储在 `Number.MAX_VALUE` 和 `Number.MIN_VALUE` 中，如果超出这个范围，则会被转化为 `Infinity/-Infinity`。有一点需要注意：`Infinity/-Infinity` 是无法参与计算的。另外，可以使用 `isFinite()` 来判断一个值是否为 `Infinity/-Infinity`。
另一个比较特殊的 `Number` 类型值是 `NaN`，即 `Not a Number`。任何涉及 `NaN` 的操作最后都会返回 `NaN`，其次 `NaN` 与任何值都不相等，包括他自身，因而当需要判断时，可以使用 `isNaN()` 函数。

## 3.6. String

## 3.7 Object

# 4. 操作符
# 5. 语句
# 6. 函数