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

	func myRequest(_ url: URLConvertible,
	               method: HTTPMethod = .get,
	               parameters: Parameters? = nil,
	               encoding: ParameterEncoding = URLEncoding.default,
	               headers: HTTPHeaders? = nil,
	               completion: @escaping (_ json: AnyObject?, _ isSuccess: Bool) -> ()) {
		
		Alamofire.request(url, method: method, 
		                  parameters: parameters, 
		                  encoding: encoding, 
		                  headers: headers).responseJSON { (response) in
							print("=============================")
							print(response.result)
							completion(response.result.value as AnyObject?, true)
		}
	}
}











