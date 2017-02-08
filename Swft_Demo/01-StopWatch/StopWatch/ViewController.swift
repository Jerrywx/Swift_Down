//
//  ViewController.swift
//  StopWatch
//
//  Created by 王潇 on 2017/2/8.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	/// 参数
	var time: CGFloat = 0.0
	var timer: Timer?
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}

	// MARK: - Action
	/// 开始计时
	func playAction() {
		print(#function)
		self.playButton.isEnabled  = false
		self.pasueButton.isEnabled = true
		/// 开始计时器
		if nil == self.timer {
			self.timer = Timer.init(timeInterval: 0.1, 
			                        target: self, 
			                        selector: #selector(timerAction), 
			                        userInfo: nil,
			                        repeats: true)
			RunLoop.current.add(self.timer!, forMode: .defaultRunLoopMode)
		}
	}
	/// 停止计时
	func pasureAction() {
		print(#function)
		self.playButton.isEnabled  = true
		self.pasueButton.isEnabled = false
		/// 关闭计时器
		if self.timer != nil {
			self.timer?.invalidate()
			self.timer = nil
		}
	}
	/// 重置计时器
	func resetAction() {
		print(#function)
		self.playButton.isEnabled  = true
		self.pasueButton.isEnabled = false
		
		if self.timer != nil {
			/// 关闭计时器
			self.timer?.invalidate()
			self.timer = nil
		}
		/// 重置时间
		self.timeLabel.text = "0.0"
		self.time = 0.0;
	}
	
	/// 计时操作
	func timerAction() {
		print(#function)
		self.time += 0.1
		self.timeLabel.text = String(format: "%.1f", self.time)
	}
	
	// MARK: - 懒加载
	/// 计时器
	lazy var timeLabel:UILabel = {
		let timeH: CGFloat  = UIScreen.main.bounds.size.height * 474.0 / 1136.0
		let frame	= CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: timeH)
		let label	= UILabel(frame: frame)
		label.font	= UIFont(name: "AvenirNext-UltraLight", size: 100)
		label.text	= "0.0"
		label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		label.textAlignment = .center
		return label
	}()
	
	/// 开始按钮
	lazy var playButton: UIButton = {
		let buttonY: CGFloat	= UIScreen.main.bounds.size.height * 474.0 / 1136.0
		let margin: CGFloat		= 4
		let buttonW: CGFloat	= UIScreen.main.bounds.size.width * 0.5 - margin - 0.5
		let buttonH: CGFloat	= UIScreen.main.bounds.size.height - buttonY
		let button = UIButton(frame: CGRect(x: margin, y: buttonY, width: buttonW, height: buttonH))
		button.setImage(#imageLiteral(resourceName: "play"), for: .normal)
		button.backgroundColor = #colorLiteral(red: 0.3294117647, green: 0.3647058824, blue: 0.9882352941, alpha: 1)
		button.addTarget(self, action: #selector(playAction), for: .touchUpInside)
		button.adjustsImageWhenHighlighted = false
		return button
	}()
	
	/// 暂停按钮
	lazy var pasueButton: UIButton = {
		let buttonY: CGFloat	= UIScreen.main.bounds.size.height * 474.0 / 1136.0
		let margin: CGFloat		= 4
		let buttonX: CGFloat	= UIScreen.main.bounds.size.width * 0.5 + 0.5
		let buttonW: CGFloat	= UIScreen.main.bounds.size.width * 0.5 - margin - 0.5
		let buttonH: CGFloat	= UIScreen.main.bounds.size.height - buttonY
		let button = UIButton(frame: CGRect(x: buttonX, y: buttonY, width: buttonW, height: buttonH))
		button.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
		button.backgroundColor = #colorLiteral(red: 0.4, green: 0.7450980392, blue: 0.03137254902, alpha: 1)
		button.addTarget(self, action: #selector(pasureAction), for: .touchUpInside)
		button.adjustsImageWhenHighlighted = false
		button.isEnabled = false
		return button
	}()
	
	/// 重置按钮
	lazy var resetButton: UIButton = {
		let x = UIScreen.main.bounds.size.width - 120;
		let frame = CGRect(x: x, y: 40, width: 100, height: 50)
		let button = UIButton(frame: frame)
		button.setTitle("Reset", for: .normal)
		button.titleLabel?.font = UIFont(name: "AvenirNext-Regular", size: 20)
		button.addTarget(self, action: #selector(resetAction), for: .touchUpInside)
		return button
	}()
}

// MARK: - 初始化界面
extension ViewController {

	/// 初始化界面
	fileprivate func setupUI() {
		/// 设置导航栏为白色
		UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent;
		/// 设置背景色
		self.view.backgroundColor = UIColor.init(colorLiteralRed: 0.0365643, 
		                                         green: 0.00723447, 
		                                         blue: 0.134848,
		                                         alpha: 1)
		/// 添加计时器
		self.view.addSubview(self.timeLabel)
		/// 添加开始按钮
		self.view.addSubview(self.pasueButton)
		/// 添加暂停按钮
		self.view.addSubview(self.playButton)
		/// 添加重置按钮
		self.view.addSubview(self.resetButton)
	}
}







