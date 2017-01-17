//
//  JRHomeViewController.swift
//  JRWb
//
//  Created by 王潇 on 2017/1/12.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

private let cellID = "homeCell"

class JRHomeViewController: JRBaseViewController {

	/// 微博模型数组
	fileprivate var statusList = [String]()
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
    }
	
	/// 好友
	@objc fileprivate func myFrients() {
		print(#function)
		let vc = JRDemoViewController()
		navigationController?.pushViewController(vc, animated: true)
	}

	/// 加载数据
	override func loadData() {
		
		DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) { 
			for i in 0..<5 {
				self.statusList.insert(i.description, at: 0)
			}
			self.tableView?.reloadData()
			self.refreshControl?.endRefreshing()
		}
	}
}

// MARK: - 界面设置
extension JRHomeViewController {
	
	/// 初始化界面
	override func setupUI() {
		super.setupUI()
		navItem.leftBarButtonItem = UIBarButtonItem(title: "好友",
		                                            target: self,
		                                            action: #selector(myFrients))
		
		tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
	}
}

// MARK: - 重写 TableView 代理方法
extension JRHomeViewController {
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return statusList.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
		cell?.textLabel?.text = statusList[indexPath.row]
		return cell!
	}
	
}




