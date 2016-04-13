//
//  NetWorkTool.swift
//  WeiBo
//
//  Created by 王潇 on 16/4/13.
//  Copyright © 2016年 王潇. All rights reserved.
//

import UIKit
import AFNetworking

class NetWorkTool: AFHTTPSessionManager {

	private static let instance: NetWorkTool = {
		// baseURL 要以 `/` 结尾
		let urlString = "https://api.weibo.com/"
		let baseURL = NSURL(string: urlString)!
		let tools = NetWorkTool(baseURL: baseURL)
		
		// 设置相应的默认反序列化格式
		tools.responseSerializer.acceptableContentTypes = NSSet(objects: "application/json", "text/json", "text/javascript", "text/plain") as? Set<String>
		return tools
	}()
	
	/// 全局访问方法
	class func sharedNetworkTools() -> NetWorkTool {
		return instance
	}
}
