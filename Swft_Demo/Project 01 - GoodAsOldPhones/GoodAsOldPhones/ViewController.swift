//
//  ViewController.swift
//  GoodAsOldPhones
//
//  Created by 王潇 on 2017/2/12.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	/// 属性
	var tableView:UITableView?
	var products = [Product(name: "1907 Wall Set", 
	                        cellImageName: "image-cell1", 
	                        fullscreenImageName: "phone-fullscreen1"),
	                Product(name: "1921 Dial Phone", 
	                        cellImageName: "image-cell2", 
	                        fullscreenImageName: "phone-fullscreen2"),
	                Product(name: "1937 Desk Set", 
	                        cellImageName: "image-cell3", 
	                        fullscreenImageName: "phone-fullscreen3"),
	                Product(name: "1984 Moto Portable", 
	                        cellImageName: "image-cell4", 
	                        fullscreenImageName: "phone-fullscreen4")]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}

}

// MARK: - 初始化界面
extension ViewController {
	
	/// 初始化界面
	fileprivate func setupUI() {
		/// 设置背景色
		view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
		/// 初始化TableView
		tableView = UITableView(frame: view.bounds, style: .grouped)
		tableView?.dataSource	= self
		tableView?.delegate		= self
		tableView?.rowHeight	= 94
		tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		view.addSubview(tableView!)
		
	}
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return products.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
		let p	 = products[indexPath.row]
		cell?.accessoryType		= .disclosureIndicator
		cell?.textLabel?.text	= p.name
		cell?.imageView?.image	= UIImage(named: p.cellImageName!)
		return cell!
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let product = products[indexPath.row]
		let vc = DetialViewController()
		vc.product = product
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
}


