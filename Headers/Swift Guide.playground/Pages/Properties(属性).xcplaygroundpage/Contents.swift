/*:
[Swift Guide](Swift%20Guide(%E5%BC%95%E5%AF%BC)) | [Previous](@previous) | [Next](@next)
****
*/

import Foundation


/*:
	零、属性
	1. 什么是属性？
	属性将值跟特定的类、结构体和枚举关联。
	存储属性存储常亮或便利作为实例的一部分,
	计算属性计算(不是存储)一个值。
	
	2. 计算属性:
	计算属性可以用于类、结构体和枚举，存储属性只能用于类和结构体。

	3. 类型属性
	存储属性和计算属性通常与特定类型的实例关联,
	类型属性可以直接作用于类型本身。

	4. 属性观察期
	属性观察器用来监控属性值得变化, 以此来触发一个自定义的操作。属性观察器可以添加到自己定义的存储属性上, 也可以添加到从父类继承的属性上。

*/

/*:
	一、存储属性
****
	一个存储属性就是存储在特定类或结构体实例里的一个常量或变量。
	存储属性可以是变量存储属性(用关键字var定义), 也可以是常量存储属性(用关键字let定义)

*/

/// 创建 一个表示范围的结构体
struct FixedLengthRange {
	var firstValue: Int
	let length: Int
}
/// 结构体实例化
var rangeOfThreadItems = FixedLengthRange(firstValue: 0, length: 3)
/// 修改实例化属性
rangeOfThreadItems.firstValue = 4


//: 1、常量结构体的存储属性
//:
//: 如果创建一个结构体的实例并将其赋值给一个常量, 则无法修改该实例的任何属性, 即使属性被声明为变量也不行。
let rangeOfLet = FixedLengthRange(firstValue: 0, length: 4)
/// 尽管 length 是一个变量, 这里还是会报错
//rangeOfLet.length = 9
//: 这种行为是由于结构体属于值类型。当值类型的实例被声明为常量的时候, 它的所有属性也就成了常量。
//:
//: 属于引用类型的类则不一样。把一个引用类型的实例赋值给一个常量后, 仍然可以修改该实例的变量属性。

//: 1、延迟存储属性

/*:
	1. 什么是延时存储属性?
		延时存储属性是指第一次被调用的时候才会计算其初始值的属性。在属性声明前使用 lazy 来标示一个延时存储属性。

	2. 注意点
		必须将延迟存储属性声明成变量(使用 var 关键字), 因为属性的初始值可能在实例构造完成之后才会得到。而常量属性在构造过程完成之前必须要有初始值, 因此无法声明成延迟属性。

	3. 使用场景
		当属性的值依赖于在实例的构造过程结束后才会知道影响值得外部因素, 或者当获得属性的初始值需要复杂或大量计算时, 可以只在需要的时候计算它。

*/

/// 加载数据类
class DataImporter {
	var fileName = "data.txt"
	init() {
//		print("加载数据")
	}
}

/// 数据管理类
class DataManager {
	lazy var importer = DataImporter()
	var data = [String]()
}

/// 使用
let manager = DataManager()
manager.data.append("Some Data")
manager.data.append("Some more Data")
// 此时数据未加载 DataImporter 实例未创建
manager.importer


//: 注意: 如果一个被标记为lazy的属性在没有初始化的时候就同时被多个线程访问, 则无法保证该属性只会被初始化一次。

//: 2、存储属性和实例变量
//:

//: “Swift 中的属性没有对应的实例变量，属性的后端存储也无法直接访问。这就避免了不同场景下访问方式的困扰，同时也将属性的定义简化成一个语句。属性的全部信息——包括命名、类型和内存管理特征——都在唯一一个地方（类型定义中）定义。”



/*:
	二、计算属性
****
	计算属性不直接存储值, 而是提供一个getter和一个可选的setter, 来简介获取和设置其他属性或变量的值。

*/
/// 声明点 结构体
struct Point {
	var x = 0.0, y = 0.0
}

/// 声明 尺寸结构体
struct Size {
	var width = 0.0, height = 0.0;
}

/// 声明 Rect 
struct Rect {
	var origin = Point()
	var size = Size()
	var center: Point {
		get {
			let centerX = origin.x + (size.width / 2)
			let centerY = origin.y + (size.height / 2)
			return Point(x: centerX, y: centerY)
		}
		
		set(newCenter) {
			origin.x = newCenter.x - (size.width / 2)
			origin.y = newCenter.y - (size.height / 2)
		}
	}
}

/// 使用

var square = Rect(origin: Point(x: 0.0, y: 0.0), 
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
print(initialSquareCenter)


//: 1、简化setter声明

//: 如果计算属性的 setter 没有定义表示新值得参数, 则可以使用默认名称 newValue.


//: 2、只读计算属性
//:
//: 只有getter 没有setter 的计算属性就是只读计算属性, 只读计算属性总是返回一个值, 可以通过点运算个访问, 但不能设置新的值。
//:
//: 注意: 必须使用 var 关键字定义计算属性, 包括只读计算属性, 因为它们的值不是固定的。let 关键之只能用来声明常量属性, 表示初始化之后再也无法修改的值。
/// 只读计算属性
struct Cuboid {
	var width = 0.0, height = 0.0, depth = 0.0
	var valume: Double {
		return width * height * depth
	}
}

/// 使用
let fourBtFiveByTwo = Cuboid(width: 4, height: 5, depth: 2)
print(fourBtFiveByTwo.valume)



/*:
	三、属性观察器
****
	1. 声明是属性观察器？
	属性观察器监控和响应属性的变化, 每次属性被设置值得时候都会调用属性观察器, 即使新值和当前值相同的时候也不例外。

	2. 属性观察器:
	willSet 在新的值被设置之前调用
	willSet 观察器会将新的属性值作为常量参数传入, 在willSet的实现代码中可以为这个参数指定一个名词, 如果不指定则参数任然可用, 这只使用默认名词 newValue 表示。

	didSet 在新的值被设置之后立即调用
	didSet 观察器会将旧的属性作为参数传入, 可以为该参数命名或者使用默认参数名 oldValue。

	3. 注意
	父类的属性在子类的构造器中被赋值时, 它在父类中的 willSet 和 didSet观察器会被调用, 随后才会调用子类的观察器。
*/

/// 计数类
class StepCounter {
	var totalSteps: Int = 0 {
		willSet(newTotalSteps) {
			print("About to set totalSteps to \(newTotalSteps)")
		}
		didSet {
			if totalSteps > oldValue  {
				print("Added \(totalSteps - oldValue) steps")
			}
		}
	}
}

/// 使用
let stepCounter = StepCounter()
//stepCounter.totalSteps = 200
//stepCounter.totalSteps = 360
//stepCounter.totalSteps = 896

/// 计数子类
class SubCounter: StepCounter {
	override var totalSteps: Int {
		willSet{
			print("Sub WillSet: \(newValue)")
		}
		
		didSet {
			print("Sub didSet: \(oldValue)")
		}
	}
}

/// 使用
let counter = SubCounter()
counter.totalSteps = 200


/*
	四、全局变量和局部变量
****
	1. 什么是全局变量和局部变量？
	

*/


/*:
****
[Swift Guide](Swift%20Guide(%E5%BC%95%E5%AF%BC)) | [Previous](@previous) | [Next](@next)
*/


