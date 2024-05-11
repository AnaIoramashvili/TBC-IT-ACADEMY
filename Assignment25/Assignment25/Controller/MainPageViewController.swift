////
////  MainPageViewController.swift
////  Assignment25
////
////  Created by Ana on 5/10/24.
////
//
//import UIKit
//
//protocol Button: AnyObject {
//   func buttonTapped()
//}
//
//class MainPageViewController: UIViewController {
//    weak var delegate: Button?
//    var selectedButton: UIButton?
//
//    lazy var coverImage: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(named: "Album Cover")
//        image.layer.cornerRadius = 20
//        image.contentMode = .scaleAspectFill
//        image.clipsToBounds = true
//        image.translatesAutoresizingMaskIntoConstraints = false
//        return image
//    }()
//
//    lazy var stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.spacing = 10
//        stackView.distribution = .fillProportionally
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//
//    lazy var songLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Let It Happen"
//        label.textAlignment = .center
//        label.textColor = .white
//        label.font = UIFont.systemFont(ofSize: 24)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    lazy var artistLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Tame Impala"
//        label.textAlignment = .center
//        label.textColor = .lightGray
//        label.font = UIFont.systemFont(ofSize: 18)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    lazy var progressBar: UIProgressView = {
//        let progressBar = UIProgressView(progressViewStyle: .bar)
//        progressBar.progressTintColor = .blue
//        progressBar.trackTintColor = .white
//        progressBar.translatesAutoresizingMaskIntoConstraints = false
//        return progressBar
//    }()
//
//    lazy var playbackControlsStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.spacing = 39
//        stackView.distribution = .fillProportionally
//        stackView.alignment = .center
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//
//    lazy var playPauseButton: UIButton = {
//        let button = UIButton()
//        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 35, weight: .regular)
//        let playImage = UIImage(systemName: "play", withConfiguration: symbolConfiguration)
//        button.setImage(playImage, for: .normal)
//        button.tintColor = .white
//        button.backgroundColor = .systemBlue
//        button.layer.cornerRadius = 30
////        button.addTarget(self, action: #selector(delegate?.buttonTapped), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    lazy var loadingImageView: UIImageView = {
//        let imageView = UIImageView(image: UIImage(named: "Loading circle"))
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//
//    lazy var tabBarView: UIView = {
//         let view = UIView()
//         view.backgroundColor = UIColor(named: "Bar Color")
//         view.layer.cornerRadius = 30
//         view.layer.shadowColor = UIColor.white.cgColor
//         view.layer.shadowOpacity = 0.2
//         view.layer.shadowOffset = .zero
//         view.layer.shadowRadius = 20
//         view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
//         view.translatesAutoresizingMaskIntoConstraints = false
//         return view
//     }()
//
//    lazy var tabBarStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .center
//        stackView.distribution = .fillProportionally
//        stackView.spacing = 80
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//
//    let shuffleImageView = UIImageView.sfSymbolImageView(systemName: "shuffle")
//    let backwardImageView = UIImageView.sfSymbolImageView(systemName: "backward.end")
//    let forwardImageView = UIImageView.sfSymbolImageView(systemName: "forward.end")
//    let repeatImageView = UIImageView.sfSymbolImageView(systemName: "repeat")
//
//    let homeImageView = UIButton.sfSymbolButton(systemName: "house")
//    let musicImageView = UIButton.sfSymbolButton(systemName: "music.note")
//    let heartImageView = UIButton.sfSymbolButton(systemName: "heart")
//
//
//    var isPlaying = false
////    var isFirstPlayTap = true
//    var progressTimer: Timer?
//    var progressValue: Float = 0.0
//
//    func addButtonTapped() {
//        homeImageView.addTarget(self, action: #selector(tabBarButtonTapped(_:)), for: .touchUpInside)
//        musicImageView.addTarget(self, action: #selector(tabBarButtonTapped(_:)), for: .touchUpInside)
//        heartImageView.addTarget(self, action: #selector(tabBarButtonTapped(_:)), for: .touchUpInside)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//        addButtonTapped()
//    }
//
//    private func setupUI() {
//        view.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
//        view.addSubview(coverImage)
//        view.addSubview(progressBar)
//        view.addSubview(loadingImageView)
//        view.addSubview(tabBarView)
//
//        view.addSubview(stackView)
//        stackView.addArrangedSubview(songLabel)
//        stackView.addArrangedSubview(artistLabel)
//
//        view.addSubview(playbackControlsStackView)
//        playbackControlsStackView.addArrangedSubview(shuffleImageView)
//        playbackControlsStackView.addArrangedSubview(backwardImageView)
//        playbackControlsStackView.addArrangedSubview(playPauseButton)
//        playbackControlsStackView.addArrangedSubview(forwardImageView)
//        playbackControlsStackView.addArrangedSubview(repeatImageView)
//
//        view.addSubview(tabBarStackView)
//        tabBarStackView.addArrangedSubview(homeImageView)
//        tabBarStackView.addArrangedSubview(musicImageView)
//        tabBarStackView.addArrangedSubview(heartImageView)
//
//        //es gadavitano sxvagan
//        loadingImageView.isHidden = true
//
//
//
//        NSLayoutConstraint.activate([
//            coverImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
//            coverImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
//            coverImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
//            coverImage.heightAnchor.constraint(equalToConstant: 300),
//
//            stackView.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 30),
//            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//
//            progressBar.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 34),
//            progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//
//            playPauseButton.widthAnchor.constraint(equalToConstant: 60),
//            playPauseButton.heightAnchor.constraint(equalToConstant: 60),
//
//            playbackControlsStackView.topAnchor.constraint(equalTo:progressBar.bottomAnchor,constant: 45),
//            playbackControlsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            loadingImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
//            loadingImageView.centerXAnchor.constraint(equalTo: coverImage.centerXAnchor),
//            loadingImageView.widthAnchor.constraint(equalToConstant: 40),
//            loadingImageView.heightAnchor.constraint(equalToConstant: 40),
//
//            tabBarView.topAnchor.constraint(equalTo: playbackControlsStackView.bottomAnchor, constant: 60),
//            tabBarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            tabBarView.widthAnchor.constraint(equalToConstant: 335),
//            tabBarView.heightAnchor.constraint(equalToConstant: 90),
//            tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//
//            tabBarStackView.topAnchor.constraint(equalTo: tabBarView.topAnchor, constant: 23),
//            tabBarStackView.centerXAnchor.constraint(equalTo: tabBarView.centerXAnchor)
//        ])
//    }
//
//
//
//
//
//    @objc func tabBarButtonTapped(_ sender: UIButton) {
//        guard sender != selectedButton else { return }
//
//        if let selectedButton = selectedButton {
//            UIView.animate(withDuration: 0.2) {
//                selectedButton.transform = .identity
//                selectedButton.tintColor = .systemGray
//            }
//        }
//
//        selectedButton = sender
//
//        UIView.animate(withDuration: 0.2) {
//            sender.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
//            sender.tintColor = .systemBlue
//        }
//    }
//}
//
//extension MainPageViewController: MainPageViewModelDelegate {
//    @objc func updateProgress() {
//        MainPageViewModel.updateProgress(<#T##self: MainPageViewModel##MainPageViewModel#>)
//    }
//
//
//
//
//    func setProgress(progressValue: Float, animated: Bool) {
//        progressBar.setProgress(progressValue, animated: true)
//    }
//
//    func scale() {
//        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveLinear, .repeat], animations: {
//            self.loadingImageView.transform = self.loadingImageView.transform.rotated(by: .pi)
//        }, completion: nil)
//        loadingImageView.isHidden = false
//    }
//
//
//    func photoConfiguration(imageName: String) {
//        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 35, weight: .regular)
//        let image = UIImage(systemName: imageName, withConfiguration: symbolConfiguration)
//        playPauseButton.setImage(image, for: .normal)
//    }
//
//    func animateTurnToIdentity() {
//        UIView.animate(withDuration: 1) {
//            self.coverImage.transform = .identity
//        }
//        loadingImageView.isHidden = true
//    }
//
//    func transformToScale() {
//        UIView.animate(withDuration: 0.5) {
//            self.coverImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
//        }
//    }
//}


//
//  MainPageViewController.swift
//  Assignment25
//
//  Created by Ana on 5/10/24.
//

import UIKit

class MainPageViewController: UIViewController {
    
    var selectedButton: UIButton?
    
    lazy var coverImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Album Cover")
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var songLabel: UILabel = {
        let label = UILabel()
        label.text = "Let It Happen"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.text = "Tame Impala"
        label.textAlignment = .center
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var progressBar: UIProgressView = {
        let progressBar = UIProgressView(progressViewStyle: .bar)
        progressBar.progressTintColor = .blue
        progressBar.trackTintColor = .white
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()
    
    lazy var playbackControlsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 39
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var playPauseButton: UIButton = {
        let button = UIButton()
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 35, weight: .regular)
        let playImage = UIImage(systemName: "play", withConfiguration: symbolConfiguration)
        button.setImage(playImage, for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(playPauseButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var loadingImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Loading circle"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var tabBarView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Bar Color")
        view.layer.cornerRadius = 30
        view.layer.shadowColor = UIColor.white.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 20
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var tabBarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 80
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let shuffleImageView = UIImageView.sfSymbolImageView(systemName: "shuffle")
    let backwardImageView = UIImageView.sfSymbolImageView(systemName: "backward.end")
    let forwardImageView = UIImageView.sfSymbolImageView(systemName: "forward.end")
    let repeatImageView = UIImageView.sfSymbolImageView(systemName: "repeat")
    
    let homeImageView = UIButton.sfSymbolButton(systemName: "house")
    let musicImageView = UIButton.sfSymbolButton(systemName: "music.note")
    let heartImageView = UIButton.sfSymbolButton(systemName: "heart")
    
    
    var isPlaying = false
    var isFirstPlayTap = true
    var progressTimer: Timer?
    var progressValue: Float = 0.0
    
    func addButtonTapped() {
        homeImageView.addTarget(self, action: #selector(tabBarButtonTapped(_:)), for: .touchUpInside)
        musicImageView.addTarget(self, action: #selector(tabBarButtonTapped(_:)), for: .touchUpInside)
        heartImageView.addTarget(self, action: #selector(tabBarButtonTapped(_:)), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addButtonTapped()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        
        view.addSubview(coverImage)
        view.addSubview(progressBar)
        view.addSubview(loadingImageView)
        view.addSubview(tabBarView)
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(songLabel)
        stackView.addArrangedSubview(artistLabel)
        
        view.addSubview(playbackControlsStackView)
        playbackControlsStackView.addArrangedSubview(shuffleImageView)
        playbackControlsStackView.addArrangedSubview(backwardImageView)
        playbackControlsStackView.addArrangedSubview(playPauseButton)
        playbackControlsStackView.addArrangedSubview(forwardImageView)
        playbackControlsStackView.addArrangedSubview(repeatImageView)
        
        view.addSubview(tabBarStackView)
        tabBarStackView.addArrangedSubview(homeImageView)
        tabBarStackView.addArrangedSubview(musicImageView)
        tabBarStackView.addArrangedSubview(heartImageView)
        
        //es gadavitano sxvagan
        loadingImageView.isHidden = true
        
        coverImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        
        
        NSLayoutConstraint.activate([
            coverImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            coverImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            coverImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            coverImage.heightAnchor.constraint(equalToConstant: 300),
            
            
            stackView.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            progressBar.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 34),
            progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            playPauseButton.widthAnchor.constraint(equalToConstant: 60),
            playPauseButton.heightAnchor.constraint(equalToConstant: 60),
            
            playbackControlsStackView.topAnchor.constraint(equalTo:progressBar.bottomAnchor,constant: 45),
            playbackControlsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loadingImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            loadingImageView.centerXAnchor.constraint(equalTo: coverImage.centerXAnchor),
            loadingImageView.widthAnchor.constraint(equalToConstant: 40),
            loadingImageView.heightAnchor.constraint(equalToConstant: 40),
            
            tabBarView.topAnchor.constraint(equalTo: playbackControlsStackView.bottomAnchor, constant: 60),
            tabBarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tabBarView.widthAnchor.constraint(equalToConstant: 335),
            tabBarView.heightAnchor.constraint(equalToConstant: 90),
            tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            tabBarStackView.topAnchor.constraint(equalTo: tabBarView.topAnchor, constant: 23),
            tabBarStackView.centerXAnchor.constraint(equalTo: tabBarView.centerXAnchor)
        ])
    }
    
    @objc private func playPauseButtonTapped() {
        isPlaying.toggle()
        updatePlayPauseButton()
        print(isPlaying)
        if isPlaying {
            handlePlay()
        } else {
            handlePause()
        }
    }
    
    private func updatePlayPauseButton() {
        let imageName = isPlaying ? "pause" : "play"
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 35, weight: .regular)
        let image = UIImage(systemName: imageName, withConfiguration: symbolConfiguration)
        playPauseButton.setImage(image, for: .normal)
    }
    
    private func handlePlay() {
        showLoadingAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.hideLoadingAnimation()
            self.startProgressTimer()
            self.showCoverImage()
        }
    }
    
    private func handlePause() {
        stopProgressTimer()
        shrinkCoverImage()
    }
    
    @objc private func updateProgress() {
        if progressValue >= 1.0 {
            stopProgressTimer()
            return
        }
        progressValue += 0.01
        progressBar.setProgress(progressValue, animated: true)
    }
    
    private func showLoadingAnimation() {
        loadingImageView.isHidden = false
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveLinear, .repeat], animations: {
            self.loadingImageView.transform = self.loadingImageView.transform.rotated(by: .pi)
        }, completion: nil)
    }
    
    private func hideLoadingAnimation() {
        loadingImageView.isHidden = true
    }
    
    private func startProgressTimer() {
        progressTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
    }
    
    private func stopProgressTimer() {
        progressTimer?.invalidate()
    }
    
    private func showCoverImage() {
        UIView.animate(withDuration: 1) {
            self.coverImage.transform = .identity
        }
    }
    
    private func shrinkCoverImage() {
        UIView.animate(withDuration: 0.5) {
            self.coverImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }
    }
    
    @objc func tabBarButtonTapped(_ sender: UIButton) {
        guard sender != selectedButton else { return }
        
        deselectPreviousTabBarButton()
        selectTabBarButton(sender)
    }
    
    private func deselectPreviousTabBarButton() {
        if let selectedButton = selectedButton {
            UIView.animate(withDuration: 0.2) {
                selectedButton.transform = .identity
                selectedButton.tintColor = .systemGray
            }
        }
    }
    
    private func selectTabBarButton(_ sender: UIButton) {
        selectedButton = sender
        UIView.animate(withDuration: 0.2) {
            sender.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            sender.tintColor = .systemBlue
        }
    }
}
