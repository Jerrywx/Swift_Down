//
//  JRHomeViewController.swift
//  JRWb
//
//  Created by 王潇 on 2017/1/12.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit
import Alamofire

private let cellID = "homeCell"

class JRHomeViewController: JRBaseViewController {

	/// 微博列表视图模型
	lazy var listViewModel = JRStatusListViewModel()
	
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
		
		listViewModel.loadStatus { (isSuccess: Bool) in
			
			self.refreshControl?.endRefreshing()
			self.tableView?.reloadData()
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
		return listViewModel.statusList.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
		cell?.textLabel?.text = listViewModel.statusList[indexPath.row].text
		return cell!
	}
	
}




