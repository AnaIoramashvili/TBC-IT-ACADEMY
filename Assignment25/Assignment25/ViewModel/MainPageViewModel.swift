//
//  MainPageViewModel.swift
//  Assignment25
//
//  Created by Ana on 5/11/24.
//

import Foundation

protocol MainPageViewModelDelegate: AnyObject {
    func updatePlayPauseButton(isPlaying: Bool)
    func showLoadingAnimation()
    func hideLoadingAnimation()
    func showCoverImage()
    func shrinkCoverImage()
    func setProgress(progressValue: Float, animated: Bool)
}

class MainPageViewModel {
    weak var delegate: MainPageViewModelDelegate?
    
    var isPlaying = false
    var isFirstPlayTap = true
    var progressTimer: Timer?
    var progressValue: Float = 0.0
    
    func playPauseButtonTapped() {
        isPlaying.toggle()
        delegate?.updatePlayPauseButton(isPlaying: isPlaying)
        if isPlaying {
            handlePlay()
        } else {
            handlePause()
        }
    }
    
    private func handlePlay() {
        delegate?.showLoadingAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.delegate?.hideLoadingAnimation()
            self.startProgressTimer()
            self.delegate?.showCoverImage()
        }
    }
    
    private func handlePause() {
        stopProgressTimer()
        delegate?.shrinkCoverImage()
    }
    
    @objc private func updateProgress() {
        if progressValue >= 1.0 {
            stopProgressTimer()
            return
        }
        progressValue += 0.01
        delegate?.setProgress(progressValue: progressValue, animated: true)
    }
    
    func startProgressTimer() {
        progressTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
    }
    
    func stopProgressTimer() {
        progressTimer?.invalidate()
    }
}
