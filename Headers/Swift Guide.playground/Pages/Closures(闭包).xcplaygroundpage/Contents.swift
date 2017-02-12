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
	二、尾随闭包
	什么是尾随闭包？
	如果你需要将一个很长的闭包表达式作为最后一个参数传递给函数, 可以使用尾随闭包来增强函数可读性。尾随闭包是一个写在函数括号之后的闭包表达式, 函数支持将其最为最后一个参数调用。
*/

func someFunctionThatTasksAClosure(closure:() -> Void) {
	// 函数体部分
	closure()
}

someFunctionThatTasksAClosure {
	print("函数")
}

let digitNames = [
	0:"zero", 1:"One", 3:"Three", 4: "Four",
	5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16, 58, 510]
let strings = numbers.map { (numb) -> String in
	return "number"
}

print(strings)

/*:
	三、值捕获
	什么是值捕获？
	闭包而已在其被定义的上下文中捕获常量或变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
*/


/*:
	四、闭包是引用类型
	
	五、逃逸闭包
	当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸

*/

var completionHandles:[()->Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
	completionHandles.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
	closure()
}

class SomeClass {
	var x = 10
	func doSomething() {
		someFunctionWithEscapingClosure { self.x = 100; print("AAA") }
		someFunctionWithNonescapingClosure { x = 200 }
	}
}

let instance = SomeClass()

instance.doSomething()
print(instance.x)
completionHandles.first!()
print(instance.x)


/*:
	六、自动闭包


*/

/*:
****
[Swift Guide](Swift%20Guide(%E5%BC%95%E5%AF%BC)) | [Previous](@previous) | [Next](@next)
*/
