//
//  VideoCellCell.swift
//  PlayLocalVideo
//
//  Created by 王潇 on 2017/2/9.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

/// 视频模型
struct video {
	let image: String
	let title: String
	let source: String
}

class VideoCellCell: UITableViewCell {

	/// 属性
	let button: UIButton = UIButton()
	let title: UILabel = UILabel()
	let time: UILabel = UILabel()
	
	/// 初始化
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupUI()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
//	override func layoutSubviews() {
//		print("ff \(self.bounds)")
//	}
	
}

// MARK: - 初始化Cell界面
extension VideoCellCell {
	
	/// 初始化界面
	fileprivate func setupUI() {
		/// 播放按钮
		button.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 220)
		button.isUserInteractionEnabled = false
		button.adjustsImageWhenHighlighted = false
		contentView.addSubview(button)
		
		/// 标题
		title.frame = CGRect(x: 0, y: 175, width: UIScreen.main.bounds.size.width, height: 20)
		title.font	= UIFont(name: "AvenirNext-Heavy", size: 14)
		title.textColor		= #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		title.textAlignment = .center
		contentView.addSubview(title)
		
		/// 时间 AvenirNext-Regular
		time.frame	= CGRect(x: 0, y: 195, width: UIScreen.main.bounds.size.width, height: 20)
		time.font	= UIFont(name: "AvenirNext-Regular", size: 10)
		time.textColor		= #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		time.textAlignment	= .center
		contentView.addSubview(time)
	}
	
}



