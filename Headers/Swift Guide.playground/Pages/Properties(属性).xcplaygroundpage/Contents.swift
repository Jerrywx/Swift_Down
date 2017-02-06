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
		print("加载数据")
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
****
[Swift Guide](Swift%20Guide(%E5%BC%95%E5%AF%BC)) | [Previous](@previous) | [Next](@next)
*/


