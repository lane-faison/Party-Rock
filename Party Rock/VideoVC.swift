//
//  VideoVC.swift
//  Party Rock
//
//  Created by Lane Faison on 5/15/17.
//  Copyright © 2017 Lane Faison. All rights reserved.
//

import UIKit

// TODO: Look up how to properly resize an iframe so the video preview isn't cut off.
class VideoVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var titleLabel: UILabel!
    private var _partyRock: PartyRock!
    
    var partyRock: PartyRock {
        get {
            return _partyRock
        } set {
            _partyRock = newValue 
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = _partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
    }


}
