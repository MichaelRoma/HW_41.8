//
//  ViewController.swift
//  HW_41.8
//
//  Created by Mykhailo Romanovskyi on 25.07.2021.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var playerControl: AVPlayerViewController!
    
    private let linksForVideo = UserUrl.getUrls()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension ViewController {
    private func setupView() {
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.reuseID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 300
        title = "Funny videos"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let url = URL(string: linksForVideo[indexPath.row].url) else { return }
        let player = AVPlayer(url: url)
        playerControl = AVPlayerViewController()
        playerControl.delegate = self
        playerControl.player = player
        playerControl.player?.play()
        present(playerControl, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        linksForVideo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.reuseID, for: indexPath) as? MyTableViewCell else { return UITableViewCell() }
        cell.title.text = linksForVideo[indexPath.row].title
        guard let url = URL(string: linksForVideo[indexPath.row].url) else {
            return cell
        }
        getThumbnailFromVideoUrl(url: url) { image in
            cell.mainImageView.image = image
        }
        return cell
    }
    
    private func getThumbnailFromVideoUrl(url: URL, completion: @escaping ((_ image: UIImage?)->Void)) {
        DispatchQueue.global().async {
            let asset = AVAsset(url: url)
            let assetImageGenerator = AVAssetImageGenerator(asset: asset)
            assetImageGenerator.appliesPreferredTrackTransform = true
            let thumbnailTime = CMTimeMake(value: 3, timescale: 1)
            do {
                let cgThumbImage = try assetImageGenerator.copyCGImage(at: thumbnailTime, actualTime: nil)
                let thumbnailImage = UIImage(cgImage: cgThumbImage)
                DispatchQueue.main.async {
                    completion(thumbnailImage)
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: AVPlayerViewControllerDelegate {}
