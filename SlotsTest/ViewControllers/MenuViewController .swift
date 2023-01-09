//
//  MenuViewController .swift
//  SlotsTest
//
//  Created by Shemets on 30/12/2022.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // Create userImageView
    private var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: MainImages.user.rawValue)
        return imageView
    }()
    // Create chestImageView
    private var chestImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: MainImages.chest.rawValue)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    // Create coinsLabel
    private var coinsLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(hex: 0x2B2836)
        label.text = ""
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()
    
    // Create aniamate view for game selection
    private var veiwForGames: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(hex: 0x292828)
        view.layer.cornerRadius = 20
        return view
    }()
    
    //  Create game selection buttons
    private var popularButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Popular", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        button.addTarget(self, action: #selector(populareButttonPressed), for: .touchUpInside)
        return button
    }()
    
    private var allGamesButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("All Games", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        button.addTarget(self, action: #selector(allGamesButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // Create first game ImageView
    private var fistGameImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: GamesImages.firstGame.rawValue)
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    // Create second game ImageView
    private var secondGameImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: GamesImages.secondGame.rawValue)
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.alpha = 0
        return imageView
    }()
    // Create third game ImageView
    private var thirdGameImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: GamesImages.thirdGame.rawValue)
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.alpha = 0
        return imageView
    }()
    // Tap gestueres for games
    private var tapOnGameOne = UITapGestureRecognizer()
    private var tapOnGameTwo = UITapGestureRecognizer()
    private var tapOnGameThree = UITapGestureRecognizer()
    
    var coinsCount = 1000
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationItem.hidesBackButton = true
        setupUI()
    }
    
    private func setupUI() {
        appDelegate.orientationLock = .portrait
        setupUserImageView()
        setupCoinsLabel()
        setupChestImageView()
        setupVeiwForGames()
        
    }
    
    // MARK: - SetupUserImageView
    private func setupUserImageView() {
        view.addSubview(userImageView)
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            userImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 34),
            userImageView.widthAnchor.constraint(equalToConstant: 60),
            userImageView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    // MARK: - SetupChestIamgeView
    private func setupChestImageView() {
        view.addSubview(chestImageView)
        NSLayoutConstraint.activate([
            chestImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            chestImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -132),
            chestImageView.widthAnchor.constraint(equalToConstant: 70),
            chestImageView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    // MARK: - SetupCoinsLabel
    private func setupCoinsLabel() {
        view.addSubview(coinsLabel)
        NSLayoutConstraint.activate([
            coinsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 75),
            coinsLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            coinsLabel.widthAnchor.constraint(equalToConstant: 131),
            coinsLabel.heightAnchor.constraint(equalToConstant: 26)
        ])
        coinsLabel.text = String(coinsCount)
    }
    // MARK: - Setup View for games selection
    private func setupVeiwForGames() {
        //frame layout for View
        let width: CGFloat = view.bounds.width
        let height: CGFloat = view.bounds.height
        veiwForGames.frame = CGRect(x: view.bounds.midX - width / 2,
                                    y: view.bounds.maxY,
                                    width: width,
                                    height: height)
        view.addSubview(veiwForGames)
        
        // Constraint layout for selection buttons
        veiwForGames.addSubview(popularButton)
        NSLayoutConstraint.activate([
            popularButton.topAnchor.constraint(equalTo: veiwForGames.topAnchor, constant: 29),
            popularButton.leftAnchor.constraint(equalTo: veiwForGames.leftAnchor, constant: 81),
            popularButton.widthAnchor.constraint(equalToConstant: 120),
            popularButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        veiwForGames.addSubview(allGamesButton)
        NSLayoutConstraint.activate([
            allGamesButton.topAnchor.constraint(equalTo: veiwForGames.topAnchor, constant: 29),
            allGamesButton.rightAnchor.constraint(equalTo: veiwForGames.rightAnchor, constant: -66),
            allGamesButton.widthAnchor.constraint(equalToConstant: 160),
            allGamesButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Costraint layout for games ImageViews
        veiwForGames.addSubview(fistGameImageView)
        NSLayoutConstraint.activate([
            fistGameImageView.topAnchor.constraint(equalTo: veiwForGames.topAnchor, constant: 95),
            fistGameImageView.leftAnchor.constraint(equalTo: veiwForGames.leftAnchor, constant: 34),
            fistGameImageView.widthAnchor.constraint(equalToConstant: 346),
            fistGameImageView.heightAnchor.constraint(equalToConstant: 165)
        ])
        tapOnGameOne = UITapGestureRecognizer(target: self, action: #selector(firstGamePressed))
        fistGameImageView.addGestureRecognizer(tapOnGameOne)
        
        veiwForGames.addSubview(secondGameImageView)
        NSLayoutConstraint.activate([
            secondGameImageView.topAnchor.constraint(equalTo: veiwForGames.topAnchor, constant: 280),
            secondGameImageView.leftAnchor.constraint(equalTo: veiwForGames.leftAnchor, constant: 34),
            secondGameImageView.widthAnchor.constraint(equalToConstant: 165),
            secondGameImageView.heightAnchor.constraint(equalToConstant: 165)
        ])
        tapOnGameTwo = UITapGestureRecognizer(target: self, action: #selector(secondGamePressed))
        secondGameImageView.addGestureRecognizer(tapOnGameTwo)
        
        
        veiwForGames.addSubview(thirdGameImageView)
        NSLayoutConstraint.activate([
            thirdGameImageView.topAnchor.constraint(equalTo: veiwForGames.topAnchor, constant: 280),
            thirdGameImageView.rightAnchor.constraint(equalTo: veiwForGames.rightAnchor, constant: -34),
            thirdGameImageView.widthAnchor.constraint(equalToConstant: 165),
            thirdGameImageView.heightAnchor.constraint(equalToConstant: 165)
        ])
        tapOnGameThree = UITapGestureRecognizer(target: self, action: #selector(thirdGamePressed))
        thirdGameImageView.addGestureRecognizer(tapOnGameThree)
       
        
        UIView.animate(withDuration: 1) {
            self.veiwForGames.frame = CGRect(x: self.view.bounds.midX - width / 2,
                                             y: self.view.bounds.minY + width / 2.5,
                                             width: width,
                                             height: height)
        }
    }
    // Method for PopulareButton
    @objc private func populareButttonPressed() {
        UIView.animate(withDuration: 0.5) {
            self.secondGameImageView.alpha = 0
            self.thirdGameImageView.alpha = 0
            self.popularButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            self.allGamesButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
       
        }
    }
    // Method for AllGamesButton
    @objc private func allGamesButtonPressed() {
        UIView.animate(withDuration: 0.5) {
            self.secondGameImageView.alpha = 1
            self.thirdGameImageView.alpha = 1
            self.allGamesButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            self.popularButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
            
        }
    }
    
    // Methods for transit to game VC
    @objc private func firstGamePressed() {
      transitToGameVC()
    }
    @objc private func secondGamePressed() {
        transitToGameVC()
    }
    @objc private func thirdGamePressed() {
        transitToGameVC()
    }
    
    private func transitToGameVC() {
        let vc = GameViewController()
        vc.coinsForBet = String(coinsCount)
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
