//
//  AlbumViewController.swift
//  Playlist
//
//  Created by Yibo Dai on 7/15/15.
//  Copyright (c) 2015 Yibo Dai. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {

    //Model: an album
    var album: Album?
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var albumCoverImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    func updateUI() {
        let albumName = "\((album?.coverImageName)!)"
        //println(albumName)
        
        backgroundImageView?.image = UIImage(named: albumName)
        albumCoverImageView?.image = UIImage(named: albumName)
        
        let songList = ((album?.songs)! as NSArray).componentsJoinedByString(", ")
        
        descriptionTextView.text = "\((album?.description)!)\n\nSome songs in the album:\n\(songList)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = (album?.coverImageName)!
        
        //can only update UI when the view is loaded, or it will crash. Because you're sending methods to nil objects
        updateUI()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //get background image out of way when the view dissapears
        backgroundImageView?.removeFromSuperview()
    }

}
 