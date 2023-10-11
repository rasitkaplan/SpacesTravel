//
//  EventTableViewCell.swift
//  SpacesTravel
//
//  Created by rasit on 2.10.2023.
//

import UIKit
import Kingfisher

class EventTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var countDownLabel: UILabel!
    // MARK: - Properties
    
    weak var timer: Timer?
    var countdownDate: Date?

    // MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        stopTimer()
    }
    
    func setCell(event : Past) {
        nameLabel.text = "Name : \(event.name ?? "")"
        locationLabel.text = "Location : \(event.location ?? "" )"
        descLabel.text = "Description : \(event.description ?? "")"
        dateLabel.text = "Date : \(Date.formattedDateFromString(dateString: event.date ?? "") ?? "")"
        eventImageView.kf.setImage(with: event.featureImage?.asURL)
        "CountDown : \(startCountdown(launch: event))"
    }
    
    func startCountdown(launch: Past) {
        guard let dateString = launch.date else {
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

