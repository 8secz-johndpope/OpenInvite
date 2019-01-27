//
//  FeedCell.swift
//  OpenInvite
//
//  Created by Riley Norris on 1/26/19.
//  Copyright © 2019 Riley Norris. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    @IBAction func acceptAction(_ sender: Any) {
        self.acceptButton.setTitle("See you there!", for: .normal)
        self.acceptButton.backgroundColor = UIColor(red: 003/255, green: 165/255, blue: 136/255, alpha: 1)
        
        self.myEvent.attendingIDs = [user.id]
        self.myEvent.save()
    }
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var inviteTextLabel: UILabel!
    @IBOutlet weak var inviterNameLabel: UILabel!
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var myEvent: Event = Event()
    
    func configure(event: Event, eventUser: User) {
        self.myEvent = event
        print(self.myEvent.attendingIDs)
        print(user.id)
        if (self.myEvent.attendingIDs.contains(user.id)) {
            self.acceptButton.setTitle("See you there!", for: .normal)
            self.acceptButton.backgroundColor = UIColor(red: 003/255, green: 165/255, blue: 136/255, alpha: 1)
        }
        
        cardView.applySoftShadow()
        inviteTextLabel.text = event.description
        inviterNameLabel.text = eventUser.displayName
        timeLabel.text = event.time.toString(dateFormat: "MM-dd h:mm a")
        locationLabel.text = event.location
        
        setProfileImage(eventUser)
        setEventImage(event)
        
    }
    
    
    func setProfileImage(_ user: User) {
        var imageURL = ""
        if (user.imageURL.isEmpty) {
            imageURL = "https://i.kym-cdn.com/entries/icons/original/000/016/212/manning.png"
        } else {
            imageURL = user.imageURL
        }
        
        let url = URL(string: imageURL)
        if let data = try? Data(contentsOf: url!) { userAvatar.image = UIImage(data: data) }
    }
    
    func setEventImage(_ event: Event) {
        var imageURL = ""
        if (event.imageURL.isEmpty) {
            imageURL = "https://i.kym-cdn.com/entries/icons/original/000/016/212/manning.png"
        } else {
            imageURL = event.imageURL
        }
        
        let url = URL(string: imageURL)
        if let data = try? Data(contentsOf: url!) { eventImage.image = UIImage(data: data) }
    }
}

