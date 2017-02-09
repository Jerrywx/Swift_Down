//
//  JRBasicViewController.swift
//  Swift-Down
//
//  Created by 王潇 on 2017/1/10.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit
import Alamofire

class JRBasicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		
		netWork()
    }
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		netWork()
	}
	
	func netWork() {
		//		Alamofire.request(<#T##url: URLConvertible##URLConvertible#>, method: <#T##HTTPMethod#>, parameters: <#T##Parameters?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>)
		let url = NSURL(fileURLWithPath: "http://test.xincheng.tv/xinchengapi/index.php/Api/News/index?in_id=54")
		Alamofire.request("http://test.xincheng.tv/xinchengapi/index.php/Api/News/index?in_id=54").response { response in
			print("Request: \(String(describing: response.request))")
			print("Response: \(String(describing: response.response))")
			print("Error: \(String(describing: response.error))")
		}
	}
}

// MARK: - Demo
extension JRBaseViewController {
	
	
	
}
