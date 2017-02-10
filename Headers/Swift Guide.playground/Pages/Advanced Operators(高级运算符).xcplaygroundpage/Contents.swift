//: [Previous](@previous)

import Foundation


/*:
	一、位运算符
****
	位运算符可以操作数据结构中每个独立的比特位。
*/

/*:
	1、按位取反运算符(~)
	作用:按位取反运算符(~)可以对一个数值的全部比特位进行取反:
	注意:按位取反运算符是一个前缀运算符, 需要直接放在运算的数之前, 并且他们之间不能添加空格。
*/

// 二进制 用 0b前缀
let initialBits:UInt8 = 0b11
print(initialBits)	// 十进制 3  转二进制 0b11
let invertedBits = ~initialBits
print(invertedBits)

/*:
	2、按位与运算符	(&)
	3、按位或运算符	(|)
	4、按位异或运算符	(^)
	5、按位左移、右移运算符	(<<、>>)
*/






/*:
	二、溢出运算符
	****
	
*/


/*:
	三、优先级和结合性
	****

	运算符的优先级使得一些运算符优先于其他运算符，高优先级的运算符会先被计算。

	结合性定义了相同优先级的运算符是如何结合的，也就是说，是与左边结合为一组，还是与右边结合为一组。
*/





/*:
	四、运算符函数
	****
	1、运算符重载:
	类和结构体可以为现有运算符提供自定义的实现, 这通常被称为运算符重载。

*/

prefix operator +++
struct Vector2D {
	var x = 0.0, y = 0.0
}

/// 重载双目运算符
extension Vector2D {
	
	
	
	static func + (left: Vector2D, right: Vector2D) -> Vector2D {
		return Vector2D(x: left.x + right.x, y: left.y + right.y)
	}
}

var v1: Vector2D = Vector2D(x: 20, y: 40)
var v2: Vector2D = Vector2D(x: 10, y: 20)
let v3 = v1 + v2
print(v3)

/*:
	2、前缀和后缀运算符
	****
	类和结构体也能提供标准单目运算符的实现, 单目运算符只运行一个值。当运算符出现在值之前时,它是前缀的(例如: -a), 而当它出现在值之后时, 它就是后缀的(例如: b!)。

	要实现前缀或者后缀运算符，需要在声明运算符函数的时候在 func 关键字之前指定 prefix 或者 postfix 修饰符：
*/

/// 重载单目运算符
extension Vector2D {
	static prefix func -(vector:Vector2D) -> Vector2D {
		return Vector2D(x: -vector.x, y: -vector.y)
	}
}

print(-v3)

/*:
	3、复合赋值运算符
	
	复合赋值运算符将赋值运算符(=)与其他运算符进行结合。例如: (+=)

	注意:
	不能对默认的赋值运算符(=)进行重载, 只有组合赋值运算符可以被重载, 同样也无法对三木运算符进行重载。
*/

/// 重载复合运算符
extension Vector2D {
	static func += (left: inout Vector2D, right:Vector2D) {
		left = left + right
	}
}

v1+=v2
print(v1)

/*:
	4、等价运算符
	
	自定义的类和结构体没有对等价运算符进行默认实现, 等价运算符通常称为"相等"运算符(==)与"不等"运算符(!=)。
*/

/// 重载等价运算符
extension Vector2D {
	static func ==(left: Vector2D, right:Vector2D) -> Bool{
		return (left.x == right.x) && (left.y == right.y)
	}
	
	static func !=(left: Vector2D, right:Vector2D) -> Bool {
		return !(left == right)
	}
}


/*: 
	五、自定义运算符
	
	除了实现标准运算符, 在Swift 中还可以声明和实现自定义运算符。
	新的运算符要使用 operator 关键字在全局作用域内进行定义, 同时还要指定 prefix、infix、postfix 修饰符

*/

/// 自定义运算符
extension Vector2D {
	static prefix func +++(vector: inout Vector2D) -> Vector2D {
		vector += vector
		return vector
	}
}
+++v2
print(v2)


/// 自定义中缀运算符的优先级
infix operator +-: AdditionPrecedence

extension Vector2D {
	static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
		return Vector2D(x: left.x + right.x, y: left.y - right.y)
	}
}

let vv1 = Vector2D(x: 20, y: 20)
let vv2 = Vector2D(x: 10, y: 10)
let vv3 = vv1+-vv2
print(vv3)


//: [Next](@next)



















