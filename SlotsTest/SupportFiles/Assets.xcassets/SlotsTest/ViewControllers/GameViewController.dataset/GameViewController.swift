//
//  GameViewController.swift
//  SlotsTest
//
//  Created by Shemets on 02/01/2023.
//

import Foundation
import UIKit

class GameViewController: UIViewController {
    
    private var backButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: MainImages.backButton.rawValue), for: .normal)
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButton()
        navigationItem.hidesBackButton = true
        appDelegate.orientationLock = .landscapeLeft
    }

    private func setupUI() {
        setupBackButton()
    }
    
    private func setupBackButton() {
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 34),
            backButton.widthAnchor.constraint(equalToConstant: 35),
            backButton.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    @objc private func backButtonPressed() {
        let vc = MenuViewController()
        vc.appDelegate.orientationLock = .portrait
        navigationController?.popViewController(animated: true)
    }
    
    
    override public var shouldAutorotate: Bool {
       return false
     }

    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
      return .landscapeRight
    }

    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
      }
}
