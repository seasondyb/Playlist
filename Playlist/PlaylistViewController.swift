//
//  PlaylistViewController.swift
//  Playlist
//
//  Created by Yibo Dai on 7/11/15.
//  Copyright (c) 2015 Yibo Dai. All rights reserved.
//

import UIKit

class PlaylistViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var coverImage0: UIImageView!
    @IBOutlet weak var coverImage1: UIImageView!
    @IBOutlet weak var coverImage2: UIImageView!
    @IBOutlet weak var coverImage3: UIImageView!
    @IBOutlet weak var coverImage4: UIImageView!
    @IBOutlet weak var coverImage5: UIImageView!
    @IBOutlet weak var coverImage6: UIImageView!
    @IBOutlet weak var coverImage7: UIImageView!
    @IBOutlet weak var coverImage8: UIImageView!
    @IBOutlet weak var coverImage9: UIImageView!
    @IBOutlet weak var coverImage10: UIImageView!
    @IBOutlet weak var coverImage11: UIImageView!
    
    //MARK: - View Controller Life Cycle
    var coverImages: [UIImageView]!
    
    
    //get called when view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //append all the cover images to the coverImage array
        coverImages = [coverImage0, coverImage1, coverImage2, coverImage3, coverImage4, coverImage5, coverImage6, coverImage7, coverImage8, coverImage9, coverImage10, coverImage11]
        
        //a method that sets cover images to those IBOutlets
        updateUI()
        
    }

    func updateUI() {
        for i in 0..<coverImages.count {
            var coverImage = coverImages[i]
            //grasp model here
            let album = Album(index: i)
            coverImage.image = UIImage(named: album.coverImageName!)
        }
    }
    
    //MARK: - TARGET/ ACTION
    @IBAction func showAlbum(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("Show Album", sender: sender)
    }
    
    //Navigate to a random album when button is tapped
    @IBAction func showFavorite(sender: UIButton) {
        performSegueWithIdentifier("Show Album", sender: sender)
    }
    
    //MARK: - Show Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "Show Album":      //sender is UITapGestureRecognizer
                //do something
                if sender is UITapGestureRecognizer {
                let albumViewController = segue.destinationViewController as! AlbumViewController
                let albumImageView = sender?.view as! UIImageView
                if let index = find(coverImages, albumImageView) {
                    let album = Album(index: index)
                    albumViewController.album = album
                }
                }
                else if sender is UIButton {
                    //a variable/property that counts the number of albums
                    var count: Int {
                        return TheBeatlesLibrary().albumCollection.count
                    }
                    let albumViewController = segue.destinationViewController as! AlbumViewController
                    let randomIndex = Int(arc4random()) % count
                    println(randomIndex)
                    let album = Album(index: randomIndex)
                    //println(album)
                    albumViewController.album = album
                }
            default: break
            }
        }
    }

}


















