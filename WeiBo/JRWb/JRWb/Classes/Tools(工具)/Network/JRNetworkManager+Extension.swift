//
//  JRNetworkManager+Extension.swift
//  JRWb
//
//  Created by 王潇 on 2017/3/6.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Foundation

// MARK: - 封装新浪微博请求方法
extension JRNetworkManager {
	
	/// 加载微博数据字典数组
	///
	/// - Parameter completion: 完成回调 [list:微博字典数组, isSuccess:是否成功]
	func statusList(completion: @escaping (_ list: [[String : AnyObject]], _ isSuccess: Bool) -> ()) {
		
		/// 接口
		let urlString = "https://api.weibo.com/2/statuses/home_timeline.json"
		
		/// 网络请求
		tokenRequest(urlString, method: .GET) { (json, isSuccess) in
			if isSuccess {
				print("成功")
				guard
					let jsonData = json
				else {
					return
				}

//				let result = jsonData["statuses"] as! [[String : AnyObject]]
//
//				completion(result, isSuccess)
			}
		}
		
	}
}
