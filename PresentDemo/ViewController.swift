//
//  ViewController.swift
//  PresentDemo
//
//  Created by Gavin on 2017/12/13.
//  Copyright © 2017年 Gavin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var titles = [String]();
    var subTypes = [String]();
    var subType = kCATransitionFromRight
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titles.append("UIModalTransitionStyleCoverVertical")
        titles.append("UIModalTransitionStyleFlipHorizontal")
        titles.append("UIModalTransitionStyleCrossDissolve")
        titles.append("UIModalTransitionStylePartialCurl")
        titles.append("pageCurl  向上翻一页")
        titles.append("pageUnCurl 向下翻一页")
        titles.append("rippleEffect 滴水效果 不支持方向")
        titles.append("suckEffect 收缩效果，如一块布被抽走 不支持方向")
        titles.append("cube 立方体效果")
        titles.append("oglFlip 翻转效果")
        titles.append("cameraIrisHollowOpen 相机打开 不支持方向")
        titles.append("cameraIrisHollowClose 相机关闭 不支持方向")
        
        titles.append(kCATransitionFade)
        titles.append(kCATransitionMoveIn)
        titles.append(kCATransitionPush)
        titles.append(kCATransitionReveal)
        
        subTypes.append(kCATransitionFromRight)
        subTypes.append(kCATransitionFromLeft)
        subTypes.append(kCATransitionFromTop)
        subTypes.append(kCATransitionFromBottom)
        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK:- Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 30
        }
        return 0;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let label = UILabel.init()
            label.text = "  方向"
            return label
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return titles.count;
        } else {
            return subTypes.count;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "111")
        if indexPath.section == 0 {
            cell.textLabel?.text = titles[indexPath.row]
        } else {
            let type =  subTypes[indexPath.row]
            cell.textLabel?.text = type
            if subType == type {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let vc = SecViewController();
            
            let animation = CATransition.init()
            animation.duration = 1.0
            /* A convenience method for creating common timing functions. The
             * currently supported names are `linear', `easeIn', `easeOut' and
             * `easeInEaseOut' and `default' (the curve used by implicit animations
             * created by Core Animation). */
            animation.timingFunction = CAMediaTimingFunction.init(name: "easeInEaseOut")
            
            switch indexPath.row {
            case 0:
                vc.modalTransitionStyle = .coverVertical
            case 1:
                vc.modalTransitionStyle = .crossDissolve
            case 2:
                vc.modalTransitionStyle = .flipHorizontal
            case 3:
                vc.modalTransitionStyle = .partialCurl
            case 4:
                animation.type = "pageCurl"
            case 5:
                animation.type = "pageUnCurl"
            case 6:
                animation.type = "rippleEffect"
            case 7:
                animation.type = "suckEffect"
            case 8:
                animation.type = "cube"
            case 9:
                animation.type = "oglFlip"
            case 10:
                animation.type = "cameraIrisHollowOpen"
            case 11:
                animation.type = "cameraIrisHollowClose"
            case 12:
                animation.type = kCATransitionFade
            case 13:
                animation.type = kCATransitionMoveIn
            case 14:
                animation.type = kCATransitionPush
            case 15:
                animation.type = kCATransitionReveal
            default:
                break
            }
            
            if indexPath.row > 3 {
                animation.subtype = subType
                self.view.window?.layer.add(animation, forKey: "animation")
            }
            
            self.present(vc, animated: true) {
                
            };
        } else {
            subType = subTypes[indexPath.row]
            tableView.reloadData()
        }
    }
}

class SecViewController : UIViewController {
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.yellow
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
}

