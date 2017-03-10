//
//  JRStatus.swift
//  JRWb
//
//  Created by 王潇 on 2017/3/10.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit
import YYModel

class JRStatus: JRBaseModel {

	// 微博ID
	var id: String = ""
	// 微博信息内容
	var text: String? = ""
	
	/// 重写 description 的计算型属性
	override var description: String {
		return yy_modelDescription()
	}
	
}
