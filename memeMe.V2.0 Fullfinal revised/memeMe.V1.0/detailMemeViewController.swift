//
//  detailMemeViewController.swift
//  memeMe.V1.0
//
//  Created by Rajpreet on 30/12/17.
//  Copyright © 2017 Rajpreet. All rights reserved.
//
//
import UIKit

class detailMemeViewController: UIViewController {

    @IBOutlet weak var memeImageView: UIImageView!
    var meme: Meme!
    override func viewDidLoad() {
        super.viewDidLoad()
        memeImageView.image = meme.memedImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        memeImageView.contentMode = .scaleAspectFit
    }
    
  


}
