//
//  ViewController.swift
//  02playLocalVideo
//
//  Created by sven on 16/12/18.
//  Copyright © 2016年 sven. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
//import VideoCell  // 不用导入?

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer() // AVFoundation
    var isPlaying = false
    var dataSource = [
        video(image:"videoScreenshot01", title: "3d马里奥", source: "Youtube - 06:32"),
        video(image:"videoScreenshot02", title: "Emoj表情", source: "Vimeo - 3:34"),
        video(image:"videoScreenshot03", title: "海洋纪录片", source: "Vine - 00:06"),
        video(image:"videoScreenshot04", title: "冒险时间", source: "Youtube - 02:39"),
        video(image:"videoScreenshot05", title: "Facebook", source: "Facebook - 10:01"),
        video(image:"videoScreenshot06", title: "丽江泸沽湖", source: "Sven - 30:01")
    ]
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func playBtnAction(sender: AnyObject) {
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")!)
        
        playerView = AVPlayer.init(URL: url)
        playViewController.player = playerView
        
        self.presentViewController(playViewController, animated: true) { // 一开始就播放
            self.playViewController.player?.play()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("viewControllerCell") as! VideoCell // xib创建的一定有,不用判断  if !cell
        
//        let cell = tableView.dequeueReusableCellWithIdentifier("viewControllerCell", forIndexPath: indexPath) as! VideoCell // 上面下面的方法都行
        
        
//        if (cell == nil) {
//            cell = UITableViewCell.init(style: <#T##UITableViewCellStyle#>, reuseIdentifier: <#T##String?#>) // 上面的写法会报错 Use of unresolved identifier 'UITableViewCellStyleDefault  用下面的写法 UITableViewCellStyle.Subtitle就行 百度: Swift table,自己瞎猜整不出来,很失望
//           cell = VideoCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "viewControllerCell") as VideoCell
//        }
//        cell.textLabel?.text = "hh"
        let videoModel = dataSource[indexPath.row]
        cell.imageCover?.image = UIImage(named: videoModel.image)
        cell.sourceLabel.text = videoModel.title
        cell.label.text = videoModel.source
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        if isPlaying { // 弹出播放视频控制器后会崩溃 因为正在播放的时候再点击视频又调用了touch方法,有创建一个播放控制器那肯定不行啊
//            return
//        }
//        
//        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")!)
//        
//        playerView = AVPlayer.init(URL: url)
//        playViewController.player = playerView
//        
////        self.presentViewController(playViewController, animated: true, completion: nil) // 一开始是不播放的
//        
//        self.presentViewController(playViewController, animated: true) { // 一开始就播放
//            self.playViewController.player?.play()
//        }
//        
//        isPlaying = true
    }

}

