//
//  ViewController.swift
//  goGaga
//
//  Created by Souvik Das on 08/01/21.
//

import UIKit

//MARK:- Hardcoded datas for UI

let array = [["Demo","Claim cash","Referals"],["Flames","Leaderboard"],["Preferences","AI-picked profiles"],["How GoGaga works?","FAQs","Support"]]
let headerTitles = ["Basic", "Saas", "Customisation", "Help & Support"]
let imgs = [[UIImage(named: "teacher"),UIImage(named: "cash"),UIImage(named: "refer")],[UIImage(named: "flames"),UIImage(named: "leader")],[UIImage(named: "heart"),UIImage(named: "ai")],[UIImage(named: "question"),UIImage(named: "question"),UIImage(named: "question")]]
let demoSongImg = [UIImage(named: "song1"),UIImage(named: "song2"),UIImage(named: "song3"),UIImage(named: "song1"),UIImage(named: "song2"),UIImage(named: "song3"),UIImage(named: "song1"),UIImage(named: "song2")]


class ViewController: UIViewController {

    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var viewSec: UIView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var name: UITextView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 50
        imageView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        viewSec.layer.cornerRadius = 10
    }
}
//MARK:- TABLEVIEW
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return array.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = array[indexPath.section][indexPath.row]
        cell.imageView?.image = imgs[indexPath.section][indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitles[section]
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
//MARK:- COLLECTIONVIEW
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return demoSongImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CellCollectionViewCell
        cell.imgCell.image = demoSongImg[indexPath.row]
        return cell
    }
    
}

