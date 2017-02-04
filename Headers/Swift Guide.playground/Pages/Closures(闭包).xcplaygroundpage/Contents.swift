/*:
[Swift Guide](Swift%20Guide(%E5%BC%95%E5%AF%BC)) | [Previous](@previous) | [Next](@next)
****
*/

import Foundation

/*:
	零、闭包
****
	1. 什么是闭包？
	闭包是自包含的函数代码块, 可以在代码中被传递和使用。
	2. 什么是包裹常量和变量
	闭包可以捕获和存储其所在上下文中任意常量和变量的引用。被称为包裹常量和变量。Swift会为你管理在捕获过中设计到的所有内存操作。
	3. 闭包的三种形式
	· 全局韩式是一个有名字但不会捕获任何值得闭包
	· 嵌套函数是一个有名字并可以捕获其封闭函数域内值得闭包
	· 闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值得匿名闭包。
	4. 闭包语法优化
	· 利用上下文推断参数和返回值类型
	· 隐式返回单表达式闭包, 即单表达式包含可以省略 return 关键字
	· 参数名称缩写
	· 尾随闭包语法
*/

/*:
	一、闭包表达式
*/

/*:
	1. 闭包表达式是一种利用简介语法构建内联闭包的方式。
*/

/// sorted 方法
let names = ["Charis", "Alex", "Ewa", "Barry", "Daniella"]

/// 1. sorted1
func backward(s1:String, s2:String) -> Bool {
	return s1 > s2
}

let newNames = names.sorted(by: backward)
//print(newNames)

/// 2. sorted2
var names2 = names.sorted { (s1:String, s2:String) -> Bool in
	return s1 > s2
}
//print(names2)

/// 3. sorted3
names.sorted { (s1, s2) -> Bool in
	return s1 > s2
}

/// 4. sorted4
names2 = names.sorted(by: {(s1, s2) -> Bool in return s1 > s2})

/// 5. sorted5
names2 = names.sorted(by: {s1, s2 in return s1 > s2})
//print(names2)

/// 6. sorted6
names2 = names.sorted(by: {s1, s2 in s1 > s2})
//print(names2)

/// 7. sorted7
names2 = names.sorted(by: {$0 > $1})
print(names2)



/*:
****
[Swift Guide](Swift%20Guide(%E5%BC%95%E5%AF%BC)) | [Previous](@previous) | [Next](@next)
*/
