//
//  MainViewController.swift
//  SlotsTest
//
//  Created by Shemets on 29/12/2022.
//

import Foundation
import UIKit

class ProgressViewController: UIViewController {
    
    private var timer = Timer()
    

    private var chestImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: MainImages.chest.rawValue)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var testDesignLabel: UILabel = {
        var label = UILabel()
        let atributedString = NSMutableAttributedString.init(string: "Test App Disign")
        let range = NSString(string: "Test App Disign").range(of: "Test", options: String.CompareOptions.caseInsensitive)
        atributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor(hex: 0x00FFFF)], range: range)
        label.attributedText = atributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private var progressView: UIProgressView = {
        var progressView = UIProgressView(progressViewStyle: .default)
        progressView.trackTintColor = .darkGray
        progressView.progressTintColor = UIColor(hex: 0x00FFFF)
        return progressView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupChestImageView()
        setupTestDesignLabel()
        setupProgressView()
        transitToMenu()
        
    }
    
    private func setupChestImageView() {
        view.addSubview(chestImageView)
        NSLayoutConstraint.activate([
            chestImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 225),
            chestImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            chestImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            chestImageView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -100)
        ])
    }
    
    private func setupTestDesignLabel() {
        view.addSubview(testDesignLabel)
        NSLayoutConstraint.activate([
            testDesignLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 540),
            testDesignLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testDesignLabel.widthAnchor.constraint(equalToConstant: 204),
            testDesignLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func setupProgressView() {
        let width: CGFloat = view.bounds.width - 40
        let height: CGFloat = 20
        progressView.frame = CGRect(x: view.bounds.midX - width / 2,
                                    y: view.bounds.midY + height * 6,
                                    width: width,
                                    height: height)
        view.addSubview(progressView)
        progressView.setProgress(0, animated: true)
        for x in 0..<100 {
            DispatchQueue.main.asyncAfter(deadline: .now()+Double(x)*0.1) {
                self.progressView.setProgress(Float(x) / 20, animated: true)
            }
        }
    }
    
    private func transitToMenu() {
        timer = Timer.scheduledTimer(timeInterval: 2.4, target: self, selector: #selector(goToMenu), userInfo: nil, repeats: false)
    }
    @objc private func goToMenu() {
       let vc = MenuViewController()
        navigationController?.pushViewController(vc, animated:  true)
    }
    
}

