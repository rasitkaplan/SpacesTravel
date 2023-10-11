//
//  LaunchTableViewCell.swift
//  SpacesTravel
//
//  Created by rasit on 28.09.2023.
//

import UIKit
import Kingfisher

class LaunchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageeView: UIImageView!
    @IBOutlet weak var launchName: UILabel!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var rocketNameLabel: UILabel!
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var countdownDate: Date?
    weak var timer: Timer?
    
    // MARK: - Lifecycle

        override func prepareForReuse() {
            super.prepareForReuse()
            stopTimer()
        }
    
    func setCell (launch: Launchh) {
        launchName.text = "Company Name : \(launch.name ?? "")"
        locationNameLabel.text = "Location Name : \(launch.pad?.location?.name ?? "")"
        rocketNameLabel.text = "Rocket Name : \(launch.launchServiceProvider?.name ?? "")"
        imageeView.kf.setImage(with: launch.image?.asURL)
        dateLabel.text = "Date : \(Date.formattedDateFromString(dateString: launch.net ?? "") ?? "")"
        startCountdown(launch: launch)
    }
    
    func startCountdown(launch: Launchh) {
        guard let dateString = launch.net else {
            countDownLabel.text = "Could not get date information"
            return
        }
        
        guard let countDownDate = Date.formattedDate(from: dateString) else {
            countDownLabel.text = "Could not get date information"
            return
        }
        
        let timeInterval = countDownDate.timeIntervalSinceNow
        if timeInterval > 0 {
            countDownLabel.text = countDownDate.countdownString()
            self.countdownDate = countDownDate
            startTimer()
        } else {
            countDownLabel.text = "Countdown ended"
        }
    }
    
    private func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: .common)
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func stopCountdown() {
        stopTimer()
        countdownDate = nil
    }
    
    @objc private func updateCountdown() {
        guard let countdownDate = countdownDate else {
            return
        }
        
        let timeInterval = countdownDate.timeIntervalSinceNow
        if timeInterval > 0 {
            countDownLabel.text = countdownDate.countdownString()
        } else {
            countDownLabel.text = "Countdown ended"
            stopCountdown()
        }
    }
}
