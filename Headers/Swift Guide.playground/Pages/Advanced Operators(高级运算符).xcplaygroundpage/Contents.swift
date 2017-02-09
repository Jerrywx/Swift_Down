//: [Previous](@previous)

import Foundation

/*:
	高级运算符
****

*/


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
	2、按位与运算符
*/


/*:
	二、溢出运算符
	****
	
*/


//: [Next](@next)
