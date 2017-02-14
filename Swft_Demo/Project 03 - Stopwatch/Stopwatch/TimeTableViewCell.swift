//
//  TimeTableViewCell.swift
//  Stopwatch
//
//  Created by 王潇 on 2017/2/13.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class TimeTableViewCell: UITableViewCell {

	var tips:UILabel = UILabel()
	var timeLabel:UILabel = UILabel()
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		tips.frame = CGRect(x: 20, y: 0, width: 200, height: 44)
		contentView.addSubview(tips)
		let width = UIScreen.main.bounds.width
		timeLabel.frame = CGRect(x: width - 200 - 20, y: 0, width: 200, height: 44)
		timeLabel.textAlignment = .right
		contentView.addSubview(timeLabel)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
