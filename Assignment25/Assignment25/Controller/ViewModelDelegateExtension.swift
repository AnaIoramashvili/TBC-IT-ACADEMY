////
////  ViewModelDelegateExtension.swift
////  Assignment25
////
////  Created by Ana on 5/12/24.
////
//
//import UIKit
//
//
//extension MainPageViewController: MainPageViewModelDelegate {
//    func updatePlayPauseButton(isPlaying: Bool) {
//        let imageName = isPlaying ? "pause" : "play"
//        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 35, weight: .regular)
//        let image = UIImage(systemName: imageName, withConfiguration: symbolConfiguration)
//        playPauseButton.setImage(image, for: .normal)
//    }
//
//    func addButtonTapped() {
//        homeImageView.addTarget(self, action: #selector(tabBarButtonTapped(_:)), for: .touchUpInside)
//        musicImageView.addTarget(self, action: #selector(tabBarButtonTapped(_:)), for: .touchUpInside)
//        heartImageView.addTarget(self, action: #selector(tabBarButtonTapped(_:)), for: .touchUpInside)
//    }
//
//    @objc func handlePlayPauseButtonTap() {
//        viewModel.playPauseButtonTapped()
//    }
//
//
//     private func selectTabBarButton(_ sender: UIButton) {
//         selectedButton = sender
//         UIView.animate(withDuration: 0.2) {
//             sender.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
//             sender.tintColor = .systemBlue
//         }
//     }
//
//
//    func showLoadingAnimation() {
//        loadingImageView.isHidden = false
//        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveLinear, .repeat], animations: {
//            self.loadingImageView.transform = self.loadingImageView.transform.rotated(by: .pi)
//        }, completion: nil)
//    }
//
//    func hideLoadingAnimation() {
//        loadingImageView.isHidden = true
//    }
//
//
//    func showCoverImage() {
//        UIView.animate(withDuration: 1) {
//            self.coverImage.transform = .identity
//        }
//    }
//
//    func shrinkCoverImage() {
//        UIView.animate(withDuration: 0.5) {
//            self.coverImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
//        }
//    }
//
//    func setProgress(progressValue: Float, animated: Bool) {
//        progressBar.setProgress(progressValue, animated: true)
//    }
//
//    @objc func tabBarButtonTapped(_ sender: UIButton) {
//         guard sender != selectedButton else { return }
//
//         deselectPreviousTabBarButton()
//         selectTabBarButton(sender)
//     }
//
//     private func deselectPreviousTabBarButton() {
//         if let selectedButton = selectedButton {
//             UIView.animate(withDuration: 0.2) {
//                 selectedButton.transform = .identity
//                 selectedButton.tintColor = .systemGray
//             }
//         }
//     }
//}
