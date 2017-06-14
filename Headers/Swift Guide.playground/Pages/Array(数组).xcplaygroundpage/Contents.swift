//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

// 创建存储 Int 类型的 空数组
var emptyInt: [Int] = []

// 创建存储 Float 类型的空数组
var emptyFloat: Array<Float> = [Float]()

// 创建存储 Double 类型的空数组
var emptyDouble: [Double] = Array()

// 创建一个存储 Int 类型的数组 分配十个元素存储空间 并且初始化为 0
var intArray: [Int] = Array(repeating: 0, count: 10)


// 创建一个存储 String 类型的数组
let streets = ["one", "two", "three"]

for street in streets {
//	print("item : \(street)")
}

// 判断数组是否为空
//if emptyInt.isEmpty {
//	print("emptyInt is empty")
//}
//
//if streets.isEmpty {
//	print("emptyInt is empty")
//} else {
//	print("emptyInt not empty")
//}
//
//print("streets count: \(streets.count)")

streets.first
streets.last

emptyDouble.last


print(streets[0], streets[1], separator: ", ")



/// 追加元素
var students = ["Ben", "Ivy", "Jordell"]

students.append("Maxime")

students.append(contentsOf: ["Shakia", "William"])


/// 插入元素
students.insert("liam", at: 3)

/// 删除元素
students.remove(at: 0)
//print(students)
students.removeLast()
//print(students)
students.removeFirst()
//print(students)

if let i = students.index(of: "Maxime") {
	students[i] = "Max"
}


var memory = ["One"]
memory.count
memory.capacity

memory.append("Two")
memory.count
memory.capacity

memory.append("Three")
memory.count
memory.capacity

var memory2 = Array(repeating: "One", count: 10)
memory2.count
memory2.capacity

memory2.reserveCapacity(20)

memory2.count
memory2.capacity

// ["Jordell", "liam", "Max", "Shakia"]


var numbers = [1, 2, 4, 8, 10]

var umbersCopy = numbers

numbers[0] = 100

//print(numbers)
//print(umbersCopy)






// An integer type with reference semantics
class IntegerReference {
	var value = 10
}
var firstIntegers = [IntegerReference(), IntegerReference()]
var secondIntegers = firstIntegers

// Modifications to an instance are visible from either array
firstIntegers[0].value = 100
print(secondIntegers[0].value)
// Prints "100"

// Replacements, additions, and removals are still visible
// only in the modified array
firstIntegers[0] = IntegerReference()
print(firstIntegers[0].value)
// Prints "10"
print(secondIntegers[0].value)
// Prints "100"






//: [Next](@next)
