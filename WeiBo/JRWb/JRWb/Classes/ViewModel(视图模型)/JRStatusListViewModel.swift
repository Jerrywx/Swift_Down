//
//  JRStatusListViewModel.swift
//  JRWb
//
//  Created by 王潇 on 2017/3/10.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Foundation

class JRStatusListViewModel {
	
	/// 微博模型数组
	lazy var statusList = [JRStatus]()
	
	/// 加载微博列表
	///
	/// - Parameter completion: 完成回调
	func loadStatus(completion: @escaping (_ isSuccess: Bool) -> ()) {
		
		/// 获取微博
		JRNetworkManager.shared.statusList { (list: [[String : AnyObject]], isSuccess: Bool) in
			
			/// 字典转模型
			guard
				let list = NSArray.yy_modelArray(with: JRStatus.self, json: list ) as? [JRStatus]
			else {
				
				completion(false)
				return
			}
			/// 拼接数据
			self.statusList += list
			completion(true)
		}
	}
}
