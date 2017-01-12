//
//  Bundle-Extensions.swift
//  JRWb
//
//  Created by 王潇 on 2017/1/13.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Foundation

extension Bundle {
	
	var namespace : String {
		return Bundle.main.infoDictionary!["CFBundleName"] as? String ?? ""
	}
	
}

