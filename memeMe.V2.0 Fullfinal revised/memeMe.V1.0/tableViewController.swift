//
//  tableViewController.swift
//  memeMe.V1.0
//
//  Created by Rajpreet on 29/12/17.
//  Copyright © 2017 Rajpreet. All rights reserved.
//

import UIKit

class tableViewController: UITableViewController {

    @IBOutlet weak var imageTableView: UIImageView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var memes: [Meme]{return appDelegate.memes}
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableIdentifier") as! tableViewCell
        
        
        let tableData = memes[(indexPath as NSIndexPath).row]
        cell.tableLabel?.text = "\(tableData.topText)...\(tableData.bottomText)"
        cell.tableLabel?.textAlignment = .center
        cell.tableImageView?.image = tableData.memedImage
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let detailMeme = self.storyboard!.instantiateViewController(withIdentifier: "detailMeme") as! detailMemeViewController
          detailMeme.meme = memes[(indexPath as NSIndexPath).row]
        navigationController!.pushViewController(detailMeme, animated: true)
    }
    
    @IBAction func newMeme(_ sender: Any) {
        
        let editor = storyboard!.instantiateViewController(withIdentifier: "newMeme")
        present(editor, animated: true, completion: nil)
        
    }

}
