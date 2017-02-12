//
//  ViewController.swift
//  Stopwatch
//
//  Created by 王潇 on 2017/2/12.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	///
	var timeLab:UILabel?
	var timeLabel:UILabel?
	var tableView:UITableView?
	var resetBtn:UIButton?
	var starBtn:UIButton?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}

}

// MARK: - 初始化界面
extension ViewController {
	
	fileprivate func setupUI() {
		view.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
		title = "Timers"
		
		subViews()
	}
	
	private func subViews() {
		
		/// 1.
		let width	 = view.bounds.width
		let height	 = view.bounds.height
		let h1:CGFloat = 221
		let h2:CGFloat = 150
		let headView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: h1))
		headView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		view.addSubview(headView)
		
		/// 2.
		timeLabel = UILabel()
		timeLabel?.text = "00:00.00"
		timeLabel?.font = UIFont(name: ".SFUIText", size: 40)
		timeLabel?.sizeToFit()
		timeLabel?.center = CGPoint(x: width * 0.5, y: 150)
		view.addSubview(timeLabel!)
		
		timeLab = UILabel(frame: CGRect(x: (timeLabel?.frame.maxX)! - 200, y: 100,
		                                width: 200, height: 25))
		timeLab?.text = "00:00.00"
		timeLab?.font = UIFont(name: ".SFUIText", size: 17)
		timeLab?.textAlignment = .right
		view.addSubview(timeLab!)
		
		timeLabel?.backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
		timeLab?.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
		
		/// 3. 
		let frame = CGRect(x: 0, y: h2 + h1,
		                   width: width, height: height - h1 - h2)
		tableView = UITableView(frame: frame)
		tableView?.dataSource = self
		tableView?.delegate   = self
		tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		view.addSubview(tableView!)
		
		let w1:CGFloat = width / 3
		let w2:CGFloat = w1 * 2
		let y1:CGFloat = 274
		
		resetBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
		resetBtn?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		resetBtn?.layer.cornerRadius = 30
		resetBtn?.center = CGPoint(x: w1 - 10, y: y1)
		view.addSubview(resetBtn!)
		resetBtn?.setTitle("Lap", for: .normal)
//		resetBtn?.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
		resetBtn?.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5), for: .normal)
		resetBtn?.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5), for: .highlighted)
		resetBtn?.titleLabel?.font = UIFont(name: ".SFUIText", size: 15)
		resetBtn?.addTarget(self, action: #selector(resetBtnAct), for: .touchUpInside)
		resetBtn?.isEnabled = false
		
		starBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
		starBtn?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		starBtn?.layer.cornerRadius = 30
		starBtn?.center = CGPoint(x: w2 + 10, y: y1)
		view.addSubview(starBtn!)
		starBtn?.setTitle("Start", for: .normal)
		starBtn?.setTitleColor(#colorLiteral(red: 0, green: 1, blue: 0, alpha: 1), for: .normal)
		starBtn?.setTitleColor(#colorLiteral(red: 0, green: 1, blue: 0, alpha: 0.5), for: .highlighted)
		starBtn?.titleLabel?.font = UIFont(name: ".SFUIText", size: 15)
		starBtn?.addTarget(self, action: #selector(starBtnAct), for: .touchUpInside)

	}

	/// 开始按钮事件
	@objc private func starBtnAct(sender: UIButton) {
		resetBtn?.isEnabled = true
		if sender.titleLabel?.text == "Start" {
			sender.setTitle("Stop", for: .normal)
			sender.setTitleColor(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1), for: .normal)
			sender.setTitleColor(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.5), for: .highlighted)
			
			resetBtn?.setTitle("Lap", for: .normal)
			resetBtn?.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
		} else {
			sender.setTitle("Start", for: .normal)
			sender.setTitleColor(#colorLiteral(red: 0, green: 1, blue: 0, alpha: 1), for: .normal)
			sender.setTitleColor(#colorLiteral(red: 0, green: 1, blue: 0, alpha: 0.5), for: .highlighted)
			
			resetBtn?.setTitle("Reset", for: .normal)
			resetBtn?.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
		}
	}
	
	/// 重置按钮事件
	@objc private func resetBtnAct(sender: UIButton) {
		
		if sender.titleLabel?.text == "Reset" {
			
			resetBtn?.setTitle("Lap", for: .normal)
			resetBtn?.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5), for: .normal)
			resetBtn?.isEnabled = false
			starBtn?.setTitle("Start", for: .normal)
			starBtn?.setTitleColor(#colorLiteral(red: 0, green: 1, blue: 0, alpha: 1), for: .normal)
		} else {
			print("计时-------------")
		}
	}
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
		cell?.textLabel?.text = "aaaa"
		return cell!
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}



