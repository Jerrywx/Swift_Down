//
//  VisitorView.swift
//  WeiBo
//
//  Created by 王潇 on 16/4/11.
//  Copyright © 2016年 王潇. All rights reserved.
//

import UIKit

class VisitorView: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		// 初始化UI
		setupUI()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	/**
	根据频道选择相对的视图
	
	- parameter isHome:    是否是首页
	- parameter imageName: 中心图片
	- parameter message:   提示文字
	*/
	func setupVisitorView(isHome: Bool, imageName: String, message: String) {
		
		// 设置控件
		iconView.hidden = !isHome
		homeIconView.image = UIImage(named: imageName)
		messageLabel.text = message
		
		// 设置动画
		if isHome {
			startAnimation()
		}
	}
	
	/**
	初始化 UI
	*/
	private func setupUI() {
		// 1. 添加控件
		addSubview(iconView)
		addSubview(maskIconView)
		addSubview(homeIconView)
		addSubview(messageLabel)
		addSubview(registerButton)
		addSubview(loginButton)
		
		// 2. 自动布局
		// 2.1 背景图标
		iconView.xmg_AlignInner(type: XMG_AlignType.Center, referView: self, size: nil)
		// 2.2 遮罩
		maskIconView.xmg_Fill(self)
		// 2.3 小房子
		homeIconView.xmg_AlignInner(type: XMG_AlignType.Center, referView: self, size: nil)
		// 2.4 消息文字
		messageLabel.xmg_AlignInner(type: XMG_AlignType.BottomCenter, referView: iconView, size: nil)
		addConstraint(NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 224))
		// 2.5 注册按钮
		registerButton.xmg_AlignVertical(type: XMG_AlignType.BottomLeft, referView: messageLabel, size: CGSizeMake(100, 35), offset: CGPointMake(0, 20))
		// 2.6登录按钮
		loginButton.xmg_AlignVertical(type: XMG_AlignType.BottomRight, referView: messageLabel, size: CGSize(width: 100, height: 35), offset: CGPoint(x: 0, y: 20))
		
	}
	
	/**
	开始动画
	*/
	private func startAnimation() {
		// 1. 创建动画
		let animation = CABasicAnimation(keyPath: "transform.rotation")
		// 2. 设置动画属性
		animation.toValue = 2 * M_PI
		animation.duration = 20
		animation.repeatCount = MAXFLOAT
		animation.removedOnCompletion = false
		// 将动画添加到图层
		iconView.layer.addAnimation(animation, forKey: nil)
		
	}

	// MARK: - 懒加载
	/// 背景图标
	private lazy var iconView: UIImageView = {
		let imageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
		return imageView
	}()
	/// 遮罩视图
	private lazy var maskIconView: UIImageView = {
		let maskIconView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
		return maskIconView
	}()
	/// 小房子
	private lazy var homeIconView: UIImageView = {
		let homeIconView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
		return homeIconView
	}()
	/// 消息文字
	private lazy var messageLabel: UILabel = {
		let label = UILabel()
		label.text = "关注一些人，回这里看看有什么惊喜"
		label.textColor = UIColor.darkGrayColor()
		label.font = UIFont.systemFontOfSize(14)
		label.numberOfLines = 0
		label.sizeToFit()
		return label
	}()
	/// 注册按钮
	private lazy var registerButton:UIButton = {
		let button = UIButton()
		button.setTitle("注册", forState: UIControlState.Normal)
		button.setBackgroundImage(UIImage(named:"common_button_white_disable"), forState: UIControlState.Normal)
		button.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
		return button
	}()
	/// 登录按钮
	private lazy var loginButton: UIButton = {
		let button = UIButton()
		button.setTitle("登录", forState: UIControlState.Normal)
		button.setBackgroundImage(UIImage(named:"common_button_white_disable"), forState: UIControlState.Normal)
		button.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
		return button
	}()
}
