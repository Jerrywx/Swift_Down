//
//  main.swift
//  SwiftDemo
//
//  Created by WX on 2022/2/7.
//

import Foundation


typealias Fn = (Int) -> Int

func getFun() -> Fn {
    var num = 0
    func plus(_ i: Int) -> Int {
        num += i
        return num
    }
    return plus
}

var ff = getFun()

print(ff(1))
print(ff(2))
print(ff(3))
print(ff(4))


//var array = [3,1,7,6,9,4,5,0]
//array.sort(by: >)
//print(array)


//func sum(v1: Int, v2: Int) -> Int {
//    v1 + v2
//}
//
//func exec(v1: Int, v2: Int, fun:(Int, Int) -> Int) {
//    print(fun(v1, v2))
//}

//exec(v1: 10, v2: 20, fun: sum(v1:v2:))

//exec(v1: 10, v2: 20, fun: {
//    (v1: Int, v2: Int) -> Int in
//        return v1 + v2
//    }
//)

//exec(v1: 20, v2: 10) { v1, v2 in
//    v1 + v2
//}

//exec(v1: 10, v2: 20, fun: {
//    v1, v2 in return v1 + v2
//})

//exec(v1: 10, v2: 10) { v1, v2 in
//    v1 + v2
//}


//exec(v1: 10, v2: 20, fun: { $0 + $1})
//exec(v1: 10, v2: 20, fun: + )

//func sum(_ v1: Int, _ v2: Int) -> Int {
//    v1 + v2
//}
//print(sum(3, 4))

//var fun = {
//    (v1: Int, v2: Int) -> Int in
//    return v1 + v2
//}
//fun(3, 4)
//print(fun(3, 4))

//var sum = {
//    (v1: Int, v2: Int) -> Int in
//    return v1 + v2;
//}(2, 5)
//print(sum)

//var sum = {
//    (_ v1 :Int, _ v2: Int) -> Int in
//    return v1 + v2
//}(33, 44)
//
//print(sum)


