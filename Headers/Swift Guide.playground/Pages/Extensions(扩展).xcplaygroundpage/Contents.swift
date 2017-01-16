//: [Previous](@previous)

import Foundation

//: 1. 扩展语法


//: 2. 计算属性

/*:
	计算型实例属性
*/



// 计算性类型属性


//: 3.构造器
/// Size
struct Size {
	var width = 0.0, height = 0.0
}
/// Point
struct Point {
	var x = 0.0, y = 0.0
}
/// Rect
struct Rect {
	var size = Size(width: 0.0, height: 0.0)
	var origin = Point(x: 0.0, y: 0.0)
}

let size = Size(width: 100, height: 100)
let point = Point(x: 20, y: 20)
let rect = Rect(size: size, origin: point)

/// 扩展构造方法
extension Rect {
	
	init(center:Point, size: Size) {
		let x = center.x - size.width * 0.5
		let y = center.y - size.height * 0.5
		self.init(size: size, origin: Point(x:x, y:y))
	}
}

let rec = Rect(center: Point(x:200, y:200), size: Size(width: 100, height: 100))
print(rec)


//: 4. 方法

//
extension Int {
	
	/// 执行多次
	func repetitions(){
		for _ in 0..<self {
			print("-----")
		}
	}
	/// 多次执行特定代码
	func repetitions2(task: ()->()) {
		for _ in 0..<self {
			task()
		}
	}
	
	/// 立方操作
	mutating func square() {
		self = self * self
	}
}
///
3.repetitions()
4.repetitions2 {
	print("......")
}

var numb = 6
numb.square()


//: 5. 小标


//: 6. 嵌套类型


//: [Next](@next)
