//
//  GameViewController.swift
//  SlotsTest
//
//  Created by Shemets on 02/01/2023.
//

import Foundation
import UIKit

class GameViewController: UIViewController {
    
    var coinsForBet = ""
    
    var currentBet = 50
    var betStep = 25
    
    // Create arrays for stacks
    private var arrayForStackOne: [UIImage?] =
    [UIImage(named: StoneGameOne.stone1.rawValue),
     UIImage(named: StoneGameOne.stone2.rawValue),
     UIImage(named: StoneGameOne.stone3.rawValue),
     UIImage(named: StoneGameOne.stone4.rawValue),
     UIImage(named: StoneGameOne.stone5.rawValue),
     UIImage(named: StoneGameOne.stone6.rawValue),
     UIImage(named: StoneGameOne.stone7.rawValue),
     UIImage(named: StoneGameOne.stone8.rawValue),
     UIImage(named: StoneGameOne.stone9.rawValue)]
    
    
    // Createm Background
    private var backgroundImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: MainImages.backroundGame.rawValue)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // Create AnimateView
    private var animateView: UIView = {
        var view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 70
        view.alpha = 0.5
        return view
    }()
    
    // Create chestImageView
    private var chestImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: MainImages.chest.rawValue)
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0
        return imageView
    }()
    
    // Create coinsLabel
    private var coinsLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .orange
        label.text = ""
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.alpha = 0
        return label
    }()
    // Create spiner image view
    private var spinerButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: MainImages.spiner.rawValue), for: .normal)
        button.addTarget(self, action: #selector(spinButtonPressed), for: .touchUpInside)
        button.alpha = 0
        return button
    }()
    // Create Change bet buttons and label
    private var minusButton: UIButton =  {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(hex: 0x292828)
        button.layer.borderColor = UIColor.red.cgColor
        button.setTitle("-", for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.alpha = 0
        button.addTarget(self, action: #selector(minusButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private var plusButton: UIButton =  {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(hex: 0x292828)
        button.layer.borderColor = UIColor.red.cgColor
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.alpha = 0
        button.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private var betLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.backgroundColor = UIColor(hex: 0x292828)
        label.textColor = .white
        label.layer.cornerRadius = 10
        label.text = "50"
        label.textAlignment = .center
        label.alpha = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    // Create BackButton
    private var backButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: MainImages.backButton.rawValue), for: .normal)
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private var stackView1: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 40
        stack.alpha = 0
        return stack
    }()
    
    private var stackView2: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 40
        stack.alpha = 0
        return stack
    }()
    
    private var stackView3: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 40
        stack.alpha = 0
        return stack
    }()
    
    private var stackView4: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 40
        stack.alpha = 0
        return stack
    }()
    
    private var stackView5: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 40
        stack.alpha = 0
        return stack
    }()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationItem.hidesBackButton = true
        appDelegate.orientationLock = .landscapeLeft
    }
    
    private func setupUI() {
        setupBackgroundView()
        setupStacks()
        setupAnimateView()
        setupChestImageView()
        setupCoinsLabel()
        setupSpinerImageView()
        setupminusAndPlus()
        setupBackButton()
    }
    
    func setupStacks() {
        setupStackView1()
        setupStackView2()
        setupStackView3()
        setupStackView4()
        setupStackView5()
    }
    
    // MARK: - func for add ImageViewToStackView
    func addImageViewToStackView() {
        let numberOfImageView = 3
        for i in 1...numberOfImageView {
            let stoneImageView = StoneImageView(frame: .zero)
            stoneImageView.image = UIImage(named: "\(StoneGameOne.stone1.rawValue)")
            stackView1.addArrangedSubview(stoneImageView)
        }
    }
    
    // MARK: - Setup StackView1
    private func setupStackView1() {
        view.addSubview(stackView1)
        let width: CGFloat = view.bounds.width / 6
        let height: CGFloat = view.bounds.width / 1.5
        stackView1.frame = CGRect(x: view.bounds.minX + width * 1.5  ,
                                  y: view.bounds.minY + width * 1.2,
                                  width: width,
                                  height: height)
        addImageViewToStackView()
        UIView.animate(withDuration: 1, delay: 1) {
            self.stackView1.alpha = 1
        }
    }
    // MARK: - Setup StackView2
    private func setupStackView2() {
        view.addSubview(stackView2)
        stackView2.frame = stackView1.frame.offsetBy(dx: stackView1.bounds.width * 1.5, dy: 0)
        let numberOfImageView = 3
        for i in 1...numberOfImageView {
            let stoneImageView = StoneImageView(frame: .zero)
            stoneImageView.image = UIImage(named: "\(StoneGameOne.stone2.rawValue)")
            stackView2.addArrangedSubview(stoneImageView)
            UIView.animate(withDuration: 1, delay: 1.2) {
                self.stackView2.alpha = 1
            }
        }
    }
    
    // MARK: - Setup StackView3
    private func setupStackView3() {
        view.addSubview(stackView3)
        stackView3.frame = stackView2.frame.offsetBy(dx: stackView2.bounds.width * 1.5, dy: 0)
        let numberOfImageView = 3
        for i in 1...numberOfImageView {
            let stoneImageView = StoneImageView(frame: .zero)
            stoneImageView.image = UIImage(named: "\(StoneGameOne.stone3.rawValue)")
            stackView3.addArrangedSubview(stoneImageView)
            UIView.animate(withDuration: 1, delay: 1.4) {
                self.stackView3.alpha = 1
            }
        }
    }
    
    // MARK: - Setup StackView4
    private func setupStackView4() {
        view.addSubview(stackView4)
        stackView4.frame = stackView3.frame.offsetBy(dx: stackView2.bounds.width * 1.5, dy: 0)
        let numberOfImageView = 3
        for i in 1...numberOfImageView {
            let stoneImageView = StoneImageView(frame: .zero)
            stoneImageView.image = UIImage(named: "\(StoneGameOne.stone4.rawValue)")
            stackView4.addArrangedSubview(stoneImageView)
            UIView.animate(withDuration: 1, delay: 1.6) {
                self.stackView4.alpha = 1
            }
        }
    }
    // MARK: - Setup StackView5
    private func setupStackView5() {
        view.addSubview(stackView5)
        stackView5.frame = stackView4.frame.offsetBy(dx: stackView2.bounds.width * 1.5, dy: 0)
        let numberOfImageView = 3
        for i in 1...numberOfImageView {
            let stoneImageView = StoneImageView(frame: .zero)
            stoneImageView.image = UIImage(named: "\(StoneGameOne.stone5.rawValue)")
            stackView5.addArrangedSubview(stoneImageView)
            UIView.animate(withDuration: 1, delay: 1.8) {
                self.stackView5.alpha = 1
            }
        }
    }
    
    
    // MARK: - Setup BackgrondView
    private func setupBackgroundView() {
        view.addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    // MARK: - Setup AnimateView
    private func setupAnimateView() {
        let width: CGFloat = view.bounds.width
        let height: CGFloat = view.bounds.height * 1.5
        animateView.frame = CGRect(x: view.bounds.maxX * 2.5,
                                   y: view.bounds.minY,
                                   width: width,
                                   height: height)
        view.addSubview(animateView)
        UIView.animate(withDuration: 1.5) {
            self.animateView.frame = CGRect(x: self.view.bounds.maxX + width / 2,
                                            y: self.view.bounds.minY,
                                            width: width,
                                            height: height)
        }
    }
    
    // MARK: - Setup ChestImageView
    private func setupChestImageView() {
        view.addSubview(chestImageView)
        NSLayoutConstraint.activate([
            chestImageView.topAnchor.constraint(equalTo: animateView.topAnchor, constant: 20),
            chestImageView.leftAnchor.constraint(equalTo: animateView.leftAnchor, constant: 70),
            chestImageView.widthAnchor.constraint(equalToConstant: 115),
            chestImageView.heightAnchor.constraint(equalToConstant: 97)
        ])
        UIView.animate(withDuration: 1, delay: 1.3) {
            self.chestImageView.alpha = 1
        }
    }
    // MARK: - Setup CoinsLabel
    private func setupCoinsLabel() {
        view.addSubview(coinsLabel)
        NSLayoutConstraint.activate([
            coinsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 92),
            coinsLabel.leftAnchor.constraint(equalTo: animateView.leftAnchor, constant: 40),
            coinsLabel.widthAnchor.constraint(equalToConstant: 170),
            coinsLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        coinsLabel.text = coinsForBet
        UIView.animate(withDuration: 1, delay: 1.4) {
            self.coinsLabel.alpha = 1
        }
    }
    
    // MARK: - Setup SpinerImageView
    private func setupSpinerImageView() {
        view.addSubview(spinerButton)
        NSLayoutConstraint.activate([
            spinerButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 155),
            spinerButton.leftAnchor.constraint(equalTo: animateView.leftAnchor, constant: 55),
            spinerButton.widthAnchor.constraint(equalToConstant: 160),
            spinerButton.heightAnchor.constraint(equalToConstant: 160)
        ])
        UIView.animate(withDuration: 1, delay: 1.5) {
            self.spinerButton.alpha = 1
        }
    }
    
    // MARK: - Setup Minus&Plus
    //Minus
    private func setupminusAndPlus() {
        view.addSubview(minusButton)
        NSLayoutConstraint.activate([
            minusButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            minusButton.leftAnchor.constraint(equalTo: animateView.leftAnchor, constant: 40),
            minusButton.widthAnchor.constraint(equalToConstant: 40),
            minusButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        //Plus
        view.addSubview(plusButton)
        NSLayoutConstraint.activate([
            plusButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            plusButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
            plusButton.widthAnchor.constraint(equalToConstant: 40),
            plusButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        view.addSubview(betLabel)
        NSLayoutConstraint.activate([
            betLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            betLabel.leftAnchor.constraint(equalTo: animateView.leftAnchor, constant: 89),
            betLabel.widthAnchor.constraint(equalToConstant: 88),
            betLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        UIView.animate(withDuration: 1, delay: 1.6) {
            self.minusButton.alpha = 1
            self.plusButton.alpha = 1
            self.betLabel.alpha = 1
        }
    }
    // MARK: - Setup BackButton
    private func setupBackButton() {
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 35),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 34),
            backButton.widthAnchor.constraint(equalToConstant: 35),
            backButton.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    //Method For SpinButton
    @objc private func spinButtonPressed() {
        for image in arrayForStackOne {
            let
        }
    }
    
    //Plus&Minus Methods
    @objc private func minusButtonPressed() {
       minus()
    }
    
    @objc private func plusButtonPressed() {
       plus()
    }
    
    // BackButton Method
    @objc private func backButtonPressed() {
        let vc = MenuViewController()
        vc.appDelegate.orientationLock = .portrait
        navigationController?.popViewController(animated: true)
    }
    
    func plus() {
       let maxBet = 1000
        if currentBet < maxBet {
            currentBet += betStep
        } else {
            print(("End"))
        }
        betLabel.text = String(currentBet)
        }
    
    func minus() {
        let minBet = 50
        if currentBet > minBet {
            currentBet -= betStep
        } else {
           print("Min")
        }
        betLabel.text = String(currentBet)
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
