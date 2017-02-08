//
//  ViewController.swift
//  CustomFont
//
//  Created by 王潇 on 2017/2/8.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	///
	var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉",
	            "测试测试测试测试测试测试",
	            "123",
	            "Alex",
	            "@@@@@@"]
	
	var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "edundot", "Gaspar Regular"]
	var tableView: UITableView?
	
	var fontRowIndex = 0
	
	///
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupUI()
	}
	
	/// 懒加载
	
}

// MARK: - 初始化界面
extension ViewController {
	
	/// 初始化界面
	fileprivate func setupUI() {
		
		/// 设置背景色
		self.view.backgroundColor = #colorLiteral(red: 0.03921568627, green: 0.03529411765, blue: 0.06666666667, alpha: 1)
		/// 设置状态栏
		UIApplication.shared.statusBarStyle = .lightContent
		/// 导航栏
		self.title = "CustomFont"
		self.navigationController?.navigationBar.barStyle = .black
		/// 添加 TableView
		self.initTableView()
		/// 添加按钮
		self.addChangeButton()
	}
	
	///
	private func initTableView() {
		let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 500)
		self.tableView = UITableView(frame: frame, style: .plain)
		self.tableView?.rowHeight	= 35
		self.tableView?.delegate	= self
		self.tableView?.dataSource	= self
		tableView?.separatorStyle	= .none
		tableView?.backgroundColor	= UIColor.clear
		self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cc")
		self.view.addSubview(self.tableView!)
	}
	
	private func addChangeButton() {
		let button = UIButton(frame: CGRect(x: 0, y: 0, width: 110, height: 110))
		button.center = CGPoint(x: UIScreen.main.bounds.width * 0.5,
		                        y: UIScreen.main.bounds.height - 130)
		button.backgroundColor	  = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
		button.layer.cornerRadius = 55
		button.setTitle("Change Font", for: .normal)
		button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 13)
		button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
		button.addTarget(self, action: #selector(changeAct), for: .touchUpInside)
		self.view.addSubview(button)
	}
	
	@objc private func changeAct() {
		fontRowIndex = (fontRowIndex + 1) % 5
		print(fontNames[fontRowIndex])
		self.tableView?.reloadData()
	}
	
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.data.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cc")
		cell?.textLabel?.text	= self.data[indexPath.row]
		cell?.backgroundColor	= UIColor.clear
		cell?.textLabel?.font	= UIFont(name:self.fontNames[fontRowIndex], size:16)
		cell?.textLabel?.textColor	= #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		return cell!
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}




