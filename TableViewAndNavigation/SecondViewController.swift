//
//  SecondViewController.swift
//  TableViewAndNavigation
//
//  Created by yonekan on 2019/03/04.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    
    var language = ""
    
    // 画面が表示される時に実行される
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = language
    }
}
