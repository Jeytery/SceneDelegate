//
//  InfoViewController.swift
//  SceneDelegate
//
//  Created by Jeytery on 10/17/20.
//  Copyright © 2020 Epsillent. All rights reserved.
//

import UIKit

protocol InfoDelegate {
    func infoBack()
}

class InfoViewController: UIViewController {

    @IBOutlet weak var tf: UITextField!
    var delegate: SceneManagerDelegate?

    @IBAction func backButtonWasPressed(_ sender: Any) {
        delegate?.changeFirstFragmentLabel(string: tf.text!)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
