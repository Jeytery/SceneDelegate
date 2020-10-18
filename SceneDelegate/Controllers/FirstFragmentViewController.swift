//
//  FirstFragmentViewController.swift
//  SceneDelegate
//
//  Created by Jeytery on 10/17/20.
//  Copyright © 2020 Epsillent. All rights reserved.
//

import UIKit

class FirstFragmentViewController: UIFragmentViewController {

    @IBOutlet weak var label: UILabel!
    var textReceiver: String?
    var delegate: MainViewDelegate?

    @IBAction func pushButtonWasPressed(_ sender: Any) {
        delegate?.pushInfoVC()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .brown
    }

}
