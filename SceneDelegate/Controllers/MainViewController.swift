//
//  MainViewController.swift
//  SceneDelegate
//
//  Created by Jeytery on 10/17/20.
//  Copyright © 2020 Epsillent. All rights reserved.
//

import UIKit

protocol MainViewDelegate {
    func pushInfoVC()
}

class MainViewController: UIViewController {

    var delegate: SceneManagerDelegate?
    let infoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "infoVC") as! InfoViewController

    @IBAction func optButtonWasPressed(_ sender: Any) {
        delegate?.putFirstScene()
    }
    
    @IBAction func hideButtonWasPressed(_ sender: Any) {
        delegate?.popFirtstScene()
    }

    @IBAction func secondSceneButtonWasPressed(_ sender: Any) {
        //delegate?.putSecondScene()
         self.navigationController?.pushViewController(infoVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }
}

extension MainViewController: MainViewDelegate {
    func pushInfoVC() {
        self.navigationController?.pushViewController(infoVC, animated: true)
    }
}
