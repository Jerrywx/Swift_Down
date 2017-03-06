//
//  JRBaseViewController.swift
//  JRWb
//
//  Created by 王潇 on 2017/1/12.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRBaseViewController: UIViewController {

	/// 自定义NavigationBar
	lazy var navBar = UINavigationBar(frame: CGRect(x: 0, 
	                                                y: 0, 
	                                                width: UIScreen.main.bounds.width, 
	                                                height: 64))
	/// 自定义NavigationItem
	lazy var navItem = UINavigationItem()
	/// TableView
	var tableView: UITableView?
	/// 刷新控件
	var refreshControl: UIRefreshControl?
	
	override var title: String? {
		didSet {
			navItem.title = title
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		automaticallyAdjustsScrollViewInsets = false
		/// 初始化 UI
		setupUI()
		/// 加载数据
		loadData()
		/// 添加刷新空间
		refreshControl = UIRefreshControl()
		tableView?.addSubview(refreshControl!)
		refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
	
	/// 加载数据
	func loadData() {
		refreshControl?.endRefreshing()
	}
}

// MARK: - 界面设置
extension JRBaseViewController {
	
	/// 界面设置
	func setupUI() {
		/// 设置导航条
		setupNavigationBar()
		/// 设置TableView
		setupTableView()
	}
	
	/// 设置 TableView
	private func setupTableView() {
		tableView = UITableView(frame: view.bounds, style: .plain)
		tableView?.delegate		= self
		tableView?.dataSource	= self
		tableView?.contentInset = UIEdgeInsets(top: 64,
		                                       left: 0, 
		                                       bottom: tabBarController?.tabBar.bounds.height ?? 0,
		                                       right: 0)
		view.insertSubview(tableView!, belowSubview: navBar)
	}
	
	/// 设置导航条
	private func setupNavigationBar() {
		view.backgroundColor = UIColor.cz_random()
		view.addSubview(navBar)
		navBar.items = [navItem]
		navBar.barTintColor  = UIColor.cz_color(withHex: 0xF6F6F6)
		navBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.darkGray]
	}
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension JRBaseViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
	}
}







