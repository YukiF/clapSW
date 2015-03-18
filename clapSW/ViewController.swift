//
//  ViewController.swift
//  clapSW
//
//  Created by Yuki.F on 2015/03/18.
//  Copyright (c) 2015年 Yuki Futagami. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate,UIPickerViewDelegate {
    
    var audioPlayer : AVAudioPlayer!
    var soundCount : Int! = 0
    @IBOutlet var clapPickerView : UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //再生する音源のURLを生成
        let soundFilePath : NSString =
        NSBundle.mainBundle().pathForResource("clap", ofType: "wav")!
        let fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath)!
        //AVAudioPlayerのインスタンス化
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playButton(sender: AnyObject) {
         audioPlayer.numberOfLoops = soundCount
        audioPlayer.play()
    }
   
    //いくつカテゴリーを持つか
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int {
        return 1
    }
    //いくつ選択肢をつくるか
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
        return 10
    }
    //選択肢になにを表示していくか1
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int)
        -> String!{
            return "\(row+1)回"
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        soundCount = row
    }

    

}

