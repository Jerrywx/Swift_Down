//
//  Bundle+JRExtension.swift
//  Swift-Down
//
//  Created by 王潇 on 2017/1/10.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

// MARK: - 获取项目命名空间
extension Bundle {
	
	var namespace: String {
		return infoDictionary!["CFBundleName"] as? String ?? ""
	}

}



