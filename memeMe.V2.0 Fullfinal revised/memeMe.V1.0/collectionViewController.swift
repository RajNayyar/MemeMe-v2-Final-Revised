//
//  collectionViewController.swift
//  memeMe.V1.0
//
//  Created by Rajpreet on 29/12/17.
//  Copyright © 2017 Rajpreet. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class collectionViewController: UICollectionViewController {
@IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    var memes:[Meme] {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let space:CGFloat = 3.0
 
         let dimensionWidth = (view.frame.size.width - (2 * space)) / 3.0
         let dimensionHeight = (view.frame.size.height - (2 * space)) / 3.0
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimensionWidth, height: dimensionHeight)
        flowLayout.itemSize = CGSize(width: dimensionWidth, height: dimensionHeight)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionIdentifier", for: indexPath) as! collectionViewCell
    
        let collectionData = self.memes[(indexPath as NSIndexPath).row]
        
       cell.collectionImage?.image = collectionData.memedImage
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailMeme = self.storyboard!.instantiateViewController(withIdentifier: "detailMeme") as! detailMemeViewController
        detailMeme.meme = memes[(indexPath as NSIndexPath).row]
        navigationController!.pushViewController(detailMeme, animated: true)
    }
 
    
    @IBAction func newMeme(_ sender: Any) {
        
        let editor = storyboard!.instantiateViewController(withIdentifier: "newMeme")
        present(editor, animated: true, completion: nil)
        
    }
    
}
