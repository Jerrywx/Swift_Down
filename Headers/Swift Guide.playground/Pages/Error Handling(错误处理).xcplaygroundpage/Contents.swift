//: [Previous](@previous)

import Foundation


/*:
	错误处理
****
	1. 什么是错误处理？
	错误处理是相应错误以及从错误中回复的过程。
	Swift提供了在运行时对可恢复错误的抛出、捕获、传递和操作支持。

*/

/*:
	一、表示并抛弃错误
****
	在Swift中, 错误用符合Error协议的类型值来标示, 这个空协议声明该类型可以用于错误处理.
	抛出错误使用throw关键字。
*/

// 声明异常
enum VendingMachineError: Error {
	case InvalidSelection						// 选择无效
	case InsufficientFunds(coinsNeeded: Int)	// 金额不足
	case OutOfStock								// 缺货
}
// 抛出异常
throw VendingMachineError.InsufficientFunds(coinsNeeded: 5)


/*:
	二、处理错误
****
	1. 用throwing函数传递错误
	什么是throwing函数？
	为了标示一个函数、方法或构造器可以抛出错误, 在函数声明的参数列表之后加上throws关键字。一个标有throws关键字的函数被称作throwing函数。如果这个函数指定了返回值类型, throws关键字需要写在箭头(->)的全面。
	func canThrowErrors() throws -> String
	func cannotThrowErrors() -> String

	一个throwing函数可以在其内部抛出错误, 并将错误传递到被调用时的作用域。
	
	注意:
		只有 throwing 函数可以传递错误, 任何在某个非throwing函数内容抛出的错误只能在函数内部处理。

*/

/// 产品
struct Item {
	var price: Int
	var count: Int
}

/// 
class VendingMachine {
	var inventory = [
	"Candy Bar": Item(price: 12, count: 7),
	"Chips": Item(price: 10, count: 4),
	"Pretzels": Item(price: 7, count: 11)
	]
	
	var coinsDeposited = 0
	func dispenseSanck(snack: String) {
		print("Dispension \(snack)")
	}
	
	func vend(itemNamed name: String) throws {
		guard let item = inventory[name] else {
			throw VendingMachineError.InvalidSelection
		}

		guard item.count > 0 else {
			throw VendingMachineError.OutOfStock
		}
		
		guard item.price <= coinsDeposited else {
			throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
		}

		coinsDeposited -= item.price

		var newItem = item
		newItem.count -= 1
		inventory[name] = newItem
		
		print("Dispensing \(name)")
	}
}

let ven = VendingMachine()
let a = try ven.vend(itemNamed: "Chips")
print(a)
print("AAA")



//: [Next](@next)





