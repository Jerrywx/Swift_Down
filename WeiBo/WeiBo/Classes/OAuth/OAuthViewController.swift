//
//  OAuthViewController.swift
//  WeiBo
//
//  Created by 王潇 on 16/4/13.
//  Copyright © 2016年 王潇. All rights reserved.
//

import UIKit
import SVProgressHUD

class OAuthViewController: UIViewController {

	private let WeiBo_App_Key: String = "2875975909"
	private let WeiBo_App_Secret:String = "9a329337ddad40d49b733eadc43624d5"
	private let WeiBo_redirect_uri:String = "http://itheima.com"
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.backgroundColor = UIColor.orangeColor()
		setupNavBar()
		view = self.webView
		loadWebView()
    }
	
	private func setupNavBar() {
	
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "关闭", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(OAuthViewController.close))
		
	}
	
	func loadWebView() {
		let url = NSURL(string: "https://api.weibo.com/oauth2/authorize?client_id=\(WeiBo_App_Key)&redirect_uri=\(WeiBo_redirect_uri)")
		webView.loadRequest(NSURLRequest(URL: url!))
	}
	
	func close() {
		dismissViewControllerAnimated(true, completion: nil)
		SVProgressHUD.dismiss()
	}

	// MARK: - 懒加载
	private lazy var webView: UIWebView = {
		let webView = UIWebView()
		webView.delegate = self
		return webView
	}()
}

extension OAuthViewController: UIWebViewDelegate {
	
	func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
		
		// 当前加载的 url
		let url = request.URL?.absoluteString

		if url!.hasPrefix(WeiBo_redirect_uri) {
			let query = request.URL?.query
			let codeStr = "code="
			if query!.hasPrefix(codeStr) {
				let code = query!.substringFromIndex(codeStr.endIndex)
				loadAccessToken(code)
//				close()
			}
			return false
		}
		return true
	}
	
	func webViewDidStartLoad(webView: UIWebView) {
		SVProgressHUD.showInfoWithStatus("正在加载网页...")
	}
	
	func webViewDidFinishLoad(webView: UIWebView){
		SVProgressHUD.dismiss()
	}
	
	private func loadAccessToken(code: String) {
		
		// 1. 请求url
		let urlString: String = "oauth2/access_token"
		// 2. 请求参数
		let params = ["client_id": WeiBo_App_Key,
		              "client_secret": WeiBo_App_Secret,
		              "grant_type": "authorization_code",
		              "code": code,
		              "redirect_uri": WeiBo_redirect_uri]
		print("参数: \(params)")
		
		
		NetWorkTool.sharedNetworkTools().POST(urlString, parameters: params, progress: nil, success: { (_, JSON) in
			print("----成功: \(JSON)")
			self.close()
			}) { (_, error) in
				print("错误: \(error)")
		}
	}
	
}




