//
//  PartyRock.swift
//  Party Rock
//
//  Created by Lane Faison on 5/15/17.
//  Copyright © 2017 Lane Faison. All rights reserved.
//

import Foundation

class PartyRock {
    private var _imageURL: String!
    private var _videoURL: String!
    private var _videoTitle: String!
    
    var imageURL: String {
        return _imageURL
    } // This keeps outside classes from manipulating our data
    
    var videoURL: String {
        return _videoURL
    } // This keeps outside classes from manipulating our data
    
    var videoTitle: String {
        return _videoTitle
    } // This keeps outside classes from manipulating our data
    
    init(imageURL: String, videoURL: String, videoTitle: String) {
        _imageURL = imageURL
        _videoURL = videoURL
        _videoTitle = videoTitle
    }
}
