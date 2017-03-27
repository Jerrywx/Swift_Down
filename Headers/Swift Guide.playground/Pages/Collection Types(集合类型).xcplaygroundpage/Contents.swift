//: [Previous](@previous)

import Foundation


/**
	数组
*/

/*	创建数组	*/

/// 创建空数组为 [Int] 类型
var someIts = [Int]()
someIts.append(3)

/// 创建一个带默认值的数组
var threeDoubles = Array(repeating: 0.0, count: 3)
/// 等价于
var threeDoubles2 = [0.0, 0.0, 0.0]

var threeString = Array(repeating: "one", count: 3)
var threeString2 = ["one", "one", "one"]


/*	合并数组	*/
var anotherThreeDoubles = Array(repeating: 2.3, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles


/*	访问和修改数组	*/
var shopList = ["Milk", "Eggs"]
/// 访问数组元素
shopList[0]

/// 获取数组元素个数
print("数量:\(shopList.count)")

/// 判断数组是否为空
if !shopList.isEmpty {
	shopList.removeAll()
}

/// 追加元素
shopList.append("beef")

/// 追加数组
shopList.append(contentsOf: ["apple", "origin"])
// 等价于
shopList += ["!!!"]

/// 修改元素
shopList[0] = "😄"




//: [Next](@next)
