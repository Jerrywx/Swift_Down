//
//  Product.swift
//  GoodAsOldPhones
//
//  Created by 王潇 on 2017/2/12.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class Product: NSObject {
	var name: String?
	var cellImageName: String?
	var fullscreenImageName: String?
	
	init(name: String, cellImageName: String, fullscreenImageName: String) {
		self.name = name
		self.cellImageName = cellImageName
		self.fullscreenImageName = fullscreenImageName
	}
}
