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
	var timer:Timer?
	var time:Int = 0
	var subTime:Int = 0
	var times:[String] = Array()
	
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
		timeLabel?.font = UIFont(name: "AvenirNext-UltraLight", size: 40)
		timeLabel?.sizeToFit()
		timeLabel?.center = CGPoint(x: width * 0.5, y: 150)
		view.addSubview(timeLabel!)
		
		timeLab = UILabel(frame: CGRect(x: (timeLabel?.frame.maxX)! - 200, y: 100,
		                                width: 200, height: 25))
		timeLab?.text = "00:00.00"
		timeLab?.font = UIFont(name: "AvenirNext-UltraLight", size: 17)
		timeLab?.textAlignment = .right
		view.addSubview(timeLab!)
		
		/// 3. 
		let frame = CGRect(x: 0, y: h2 + h1,
		                   width: width, height: height - h1 - h2)
		tableView = UITableView(frame: frame)
		tableView?.dataSource = self
		tableView?.delegate   = self
		tableView?.register(TimeTableViewCell.self, forCellReuseIdentifier: "cell")
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

			timer = Timer(timeInterval: 0.035,
			              target: self, 
			              selector: #selector(timeAct), 
			              userInfo: nil,
			              repeats: true)
			RunLoop.current.add(timer!, forMode: .commonModes)
		} else {
			sender.setTitle("Start", for: .normal)
			sender.setTitleColor(#colorLiteral(red: 0, green: 1, blue: 0, alpha: 1), for: .normal)
			sender.setTitleColor(#colorLiteral(red: 0, green: 1, blue: 0, alpha: 0.5), for: .highlighted)
			
			resetBtn?.setTitle("Reset", for: .normal)
			resetBtn?.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
			
			if nil != timer {
				timer?.invalidate()
				timer = nil
			}
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
			
			time	= 0
			subTime = 0
			timeLab?.text	= "00:00.00"
			timeLabel?.text = "00:00.00"
			times.removeAll()
			tableView?.reloadData()
			
		} else {
			subTime = 0
			times.append(caclTime(time: time))
			tableView?.reloadData()
			let indexPath = NSIndexPath(row: times.count - 1, section: 0)
			tableView?.scrollToRow(at: indexPath as IndexPath, at: .bottom, animated: true)
		}
	}
	/// 计时器
	@objc private func timeAct() {
		time += 1
		subTime += 1
		timeLabel?.text = caclTime(time: time)
		timeLab?.text = caclTime(time: subTime)
	}
	/// 计算时间
	private func caclTime(time:NSInteger) -> String {
		let h = time % 100
		let f = (time / 100) % 60
		let ho = (time / 100) / 60
		return String(format: "%.2d:%.2d.%.2d", ho, f, h)
	}
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return times.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TimeTableViewCell
		cell.tips.text = String(format: "Tips %zd", indexPath.row + 1)
		cell.timeLabel.text = times[indexPath.row]
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}



