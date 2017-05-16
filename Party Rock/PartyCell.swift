//
//  PartyCell.swift
//  Party Rock
//
//  Created by Lane Faison on 5/15/17.
//  Copyright © 2017 Lane Faison. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateUI(partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle

        let url = URL(string: partyRock.imageURL)!
        
        // This creates a background thread for the images to download
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch {
                // Handle the error
            }
        }
    
    }

}
