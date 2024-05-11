////
////  MainPageViewModel.swift
////  Assignment25
////
////  Created by Ana on 5/11/24.
////
//
//import Foundation
//
//protocol MainPageViewModelDelegate: AnyObject {
//    func setProgress(progressValue: Float, animated: Bool)
//    func scale()
//    func photoConfiguration(imageName: String)
//    func animateTurnToIdentity()
//    func transformToScale()
//    func updateProgress()
//}
//
//class MainPageViewModel {
//    
//    var progressTimer: Timer?
//    var progressValue: Float = 0.0
//    weak var delegate: MainPageViewModelDelegate?
//    var isPlaying = false
//    var isFirstPlayTap = true
//    
//    func playPauseButtonTapped() {
//        isPlaying.toggle()
//        let imageName = isPlaying ? "pause" : "play"
//        delegate?.photoConfiguration(imageName: imageName)
//       
//        if isPlaying {
//            if isFirstPlayTap {
//                isFirstPlayTap = false
//            } else {
//                delegate?.scale()
//                
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
//                    self?.progressTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self as Any, selector: #selector(self?.updateProgress), userInfo: nil, repeats: true)
//                    self?.delegate?.animateTurnToIdentity()
//                }
//            }
//        } else {
//            progressTimer?.invalidate()
//            delegate?.transformToScale()
//            // Reset progress value
//            progressValue = 0.0
//        }
//    }
//    
//    func updateProgress() {
//        if progressValue >= 1.0 {
//            progressTimer?.invalidate()
//            return
//        }
//        progressValue += 0.01
//        delegate?.setProgress(progressValue: progressValue, animated: true)
//    }
//}
