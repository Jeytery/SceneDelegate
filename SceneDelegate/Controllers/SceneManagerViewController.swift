//
//  SceneManagerViewController.swift
//  SceneDelegate
//
//  Created by Jeytery on 10/17/20.
//  Copyright © 2020 Epsillent. All rights reserved.
//

import UIKit

protocol SceneManagerDelegate {

    func putFirstScene()
    func popFirtstScene()
    func putSecondScene()
    func popSecondScene()
    func changeFirstFragmentLabel(string: String)

}

class SceneManagerViewController: UIViewController {

    let firstFragmentVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "firstFVC") as! FirstFragmentViewController
    let secondFragmentVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "secondFVC") as! SecondFragmentViewController
    let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "mainVC") as MainViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .green

        configureMainVC()
        configureFirstFragmentVC()
        configureSecondeFragmentVC()

    }

    private func configureMainVC() {
        let navigation = UINavigationController(rootViewController: mainVC)
        self.view.addSubview(navigation.view)
        self.addChild(navigation)
        self.mainVC.delegate = self
        self.mainVC.infoVC.delegate = self
        navigation.didMove(toParent: self)
    }

    private func configureFirstFragmentVC() {
        self.firstFragmentVC.delegate = mainVC
    }

    private func configureSecondeFragmentVC() {

    }
}

extension SceneManagerViewController: SceneManagerDelegate {

    func putSecondScene() {
        self.secondFragmentVC.initialiseFragment()
        self.secondFragmentVC.mainVC = mainVC
        self.secondFragmentVC.size = 400
        self.secondFragmentVC.side = .bottom
        self.secondFragmentVC.initialiseFragment()
        self.secondFragmentVC.showFragment()
    }

    func popSecondScene() {
        self.secondFragmentVC.hideFragment()
        self.secondFragmentVC.deinitialiseFragment()
    }

    func popFirtstScene() {
        self.firstFragmentVC.hideFragment()
        //self.firstFragmentVC.deinitialiseFragment()
    }

    func putFirstScene() {
        self.firstFragmentVC.initialiseFragment()
        self.firstFragmentVC.mainVC = mainVC
        self.firstFragmentVC.size = 300
        self.firstFragmentVC.side = .bottom
        self.firstFragmentVC.initialiseFragment()
        self.firstFragmentVC.showFragment()
    }

    func changeFirstFragmentLabel(string: String) {
        self.firstFragmentVC.textReceiver = string
        self.firstFragmentVC.label.text = string
    }
}
