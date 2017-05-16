//
//  ViewController.swift
//  Party Rock
//
//  Created by Lane Faison on 5/15/17.
//  Copyright © 2017 Lane Faison. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // UITableViewDelegate/DataSource both needed when working with tables.
    // You must also have an IBOutlet for the tableView, and you must
    // implement the cellForRowAt and numberOfRowsInSection functions like below,
    // at minimum.
    // Also always have in the to 'self' properties below too.
    // Make sure you set the identifier in the Attribute Inspector for the cell
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ev4bY1SkZLg\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Lights Out")
        
        let p2 = PartyRock(imageURL: "http://www.croshalgroup.com/wp-content/uploads/2015/05/Redfoo-Website.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/1w9DiGlZksU\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Let's Get Ridiculous")
        let p3 = PartyRock(imageURL: "https://i.ytimg.com/vi/2wUxw6GH3IM/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/vg_nvEGryA4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle Lesson")
        let p4 = PartyRock(imageURL: "http://www.billboard.com/files/styles/article_main_image/public/media/lmfao-party-rock-anthem-2011-billboard-650.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/gZIqW92GaTQ\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Party Rock Commercial")
        let p5 = PartyRock(imageURL: "http://direct-ns.rhap.com/imageserver/v2/albums/Alb.219913217/images/600x600.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tWyuglGCKgE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle")
        
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)

        
        // Use the backslash to escape the quotes
        
        tableView.delegate = self
        tableView.dataSource = self
        // This makes its so the tableView knows to call the functions below.

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
            
        } else {
            return UITableViewCell()
        }
        
    } // This is Apple's way of recycling cells when they go off the screen.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }

}

