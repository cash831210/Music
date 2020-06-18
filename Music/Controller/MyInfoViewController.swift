//
//  MyInfoViewController.swift
//  Music
//
//  Created by 莊鎧旭 on 2020/6/12.
//  Copyright © 2020 Cash. All rights reserved.
//

import UIKit
import SwiftUI

class MyInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBSegueAction func showInfo(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: ContentView())
    }
    
    
}
