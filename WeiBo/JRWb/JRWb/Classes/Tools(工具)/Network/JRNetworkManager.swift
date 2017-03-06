//
//  JRNetworkManager.swift
//  JRWb
//
//  Created by 王潇 on 2017/2/9.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit
import Alamofire

enum JRNetWorkMethond {
	case GET
	case POST
}

/// 网络管理工具
class JRNetworkManager {
	
	/// 网络单粒
	static let shared = JRNetworkManager()

	/// 封装 Alamofire 网络请求方法
	///
	/// - Parameters:
	///   - url: 网络请求URL
	///   - method: 网络请求方法 默认 Post
	///   - parameters: 网络请求参数 默认为空
	///   - encoding: 编码方式 默认
	///   - headers: 网络请求头 默认为空
	///   - completion: 网络请求完成回调
	func myRequest(_ url: URLConvertible,
	               method: JRNetWorkMethond = .POST,
	               parameters: Parameters? = nil,
	               encoding: ParameterEncoding = URLEncoding.default,
	               headers: HTTPHeaders? = nil,
	               completion: @escaping (_ json: AnyObject?, _ isSuccess: Bool) -> ()) {

		/// 区分网络请求方法
		var aMethond: HTTPMethod = .post
		if method == .GET {
			aMethond = .get
		}
		
//		Generic parameter 'Value' could not be inferred
		/// 成功回调闭包
		let completion = { (response: DataResponse<Any>) -> () in
			
			/// 网络请求判断
			if response.result.isSuccess {
				completion(response.result.value as AnyObject?, true)
			} else {
				/// 输出请求错误
				print("网络请求错误: \(response.result.error)")
				completion(nil, false)
			}
		}
		
		/// 网络请求
		Alamofire.request(url, method: aMethond, 
		                  parameters: parameters, 
		                  encoding: encoding, 
		                  headers: headers).responseJSON(completionHandler: completion)

	}
}











