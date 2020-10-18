//
//  FragmentViewController.swift
//  3bit_client
//
//  Created by Jeytery on 10/15/20.
//  Copyright © 2020 Epsillent. All rights reserved.
//

import UIKit

enum Side {
    case left
    case right
    case bottom
    case top
}

class UIFragmentViewController: UIViewController {

    public var mainVC: UIViewController?
    public var side: Side?
    public var size: Int?
    private let screenSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //NotificationCenter.addObserver(self, selector: #selector(self.showFragment), name: UIDevice.orientationDidChangeNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.rotationCaused), name: UIDevice.orientationDidChangeNotification, object: nil)
    }

    public func putFragment() {
        guard self.mainVC != nil && size != nil && side != nil else { print("MainVC or size or side is nil!"); return }
        self.view.frame = CGRect(x: 0, y: Int(screenSize.height) - size!, width: Int(self.screenSize.width), height: size!)
        self.mainVC!.addChild(self)
        self.mainVC!.view.addSubview(self.view)
    }

    public func initialiseFragment() {
        guard self.mainVC != nil && size != nil else { print("MainVC or size is nil!"); return }
        switch side {
            case .bottom:
                print("bottom")
                self.view.frame = CGRect(x: 0, y: Int(screenSize.height), width: Int(self.screenSize.width), height: size!)
                self.mainVC!.addChild(self)
                self.mainVC!.view.addSubview(self.view)
            case .left:
                print("left")
            case .right:
                print("right")
            default:
                print("default")
        }
    }

    public func showFragment() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 1.0,
            initialSpringVelocity: 1.0,
            options: .curveEaseIn,
            animations: {
                self.view.frame = CGRect(x: 0, y: Int(self.screenSize.height) - self.size!, width: Int(self.screenSize.width), height: self.size!)
            },
            completion: nil)
    }

    public func hideFragment() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 1.0,
            initialSpringVelocity: 1.0,
            options: .curveEaseIn,
            animations: {
                self.view.frame = CGRect(x: 0, y: Int(self.screenSize.height), width: Int(self.screenSize.width), height: self.size!)
            },
            completion: nil)
    }

    public func deinitialiseFragment() {
        self.view.removeFromSuperview()
        self.removeFromParent()
    }

    @objc func rotationCaused() {
        if UIDevice.current.orientation.isLandscape {
            print("rotation has been caused!")
            deinitialiseFragment()
            initialiseFragment()
            showFragment()
        }
    }
}
