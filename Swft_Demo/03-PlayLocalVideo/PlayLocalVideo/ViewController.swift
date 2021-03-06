//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by 王潇 on 2017/2/9.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

	var playViewController = AVPlayerViewController()
	var playerView = AVPlayer()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}

	var data = [
		video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
		video(image: "videoScreenshot02", title: "Emoji Among Us",		source: "Vimeo - 3:34"),
		video(image: "videoScreenshot03", title: "Seals Documentary",	source: "Vine - 00:06"),
		video(image: "videoScreenshot04", title: "Adventure Time",		source: "Youtube - 02:39"),
		video(image: "videoScreenshot05", title: "Facebook HQ",			source: "Facebook - 10:20"),
		video(image: "videoScreenshot06", title: "Lijiang Lugu Lake",	source: "Allen - 20:30")
	]
}

// MARK: - 初始化界面
extension ViewController {
	
	fileprivate func setupUI() {
		self.title = "Watch Later"
		/// 设置背景色
		self.view.backgroundColor = #colorLiteral(red: 0.05490196078, green: 0.05490196078, blue: 0.05882352941, alpha: 1)
		/// 导航栏
		self.navigationController?.navigationBar.barStyle = .blackOpaque
		/// 添加 tableView
		initTableView()
	}
	
	/// 创建tableView
	private func initTableView() {
		let tableView = UITableView(frame: self.view.bounds)
		tableView.rowHeight  = 220
		tableView.delegate   = self
		tableView.dataSource = self
		tableView.separatorStyle  = .none
		tableView.backgroundColor = UIColor.clear
		tableView.register(VideoCellCell.self, forCellReuseIdentifier: "cell")
		self.view.addSubview(tableView)
	}
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		print(data.count)
		 return data.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! VideoCellCell
		cell.selectionStyle = .none
		let videoModel = data[indexPath.row]
		cell.video = videoModel
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		
		let path = Bundle.main.path(forResource: "moments", ofType: "mp4")
		
		playerView = AVPlayer(url: URL(fileURLWithPath: path!))
		playViewController.player = playerView
		self.present(playViewController, animated: true) {
			self.playViewController.player?.play()
		}
	}
}



