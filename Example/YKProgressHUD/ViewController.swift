//
//  ViewController.swift
//  YKProgressHUD
//
//  Created by hesong_ios@163.com on 07/10/2019.
//  Copyright (c) 2019 hesong_ios@163.com. All rights reserved.
//

import UIKit
import YKProgressHUD

class ViewController: UITableViewController {

    var screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    let cellIdentifier = "cell"
    
    lazy var actionTexts = ["show", "show with status", "showProgress", "showProgress with status", "shwoImage", "showImage with status", "showInfo", "showSuccess", "showError", "showMessage", "showGif", "showGif with status"]
    
    lazy var headerTexts = ["动画显示/隐藏样式","遮罩样式", "加载样式", "方法", "其它"]
    
    var progressValue: CGFloat = 0
    
    lazy var animationShowStyles = [(text: "fade", animationShowStyle: YKProgressHUDAnimationShowStyle.fade), (text: "zoom", animationShowStyle: YKProgressHUDAnimationShowStyle.zoom), (text: "flyInto", animationShowStyle: YKProgressHUDAnimationShowStyle.flyInto)]
    var currentAnimationShowStyleIndex = 0
    
    lazy var maskStyles = [(text: "visible", maskStyle: YKProgressHUDMaskStyle.visible), (text: "hide", maskStyle: YKProgressHUDMaskStyle.hide)]
    var currentMaskStyleIndex = 0
    
    lazy var animationStyles = [(text: "circle", animationStyle: YKProgressHUDAnimationStyle.circle), (text: "system", animationStyle: YKProgressHUDAnimationStyle.system)]
    var currentAnimationStyleIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backBarButtonItem = UIBarButtonItem()
        backBarButtonItem.title = ""
        self.navigationItem.backBarButtonItem = backBarButtonItem
        self.title = "YKProgressHUD"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.headerTexts.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 3:
            return self.actionTexts.count
        case 4:
            return 2
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier)
        
        cell?.accessoryType = .none
        if indexPath.section == 0 {
            cell?.textLabel?.text = self.animationShowStyles[self.currentAnimationShowStyleIndex].text
            cell?.accessoryType = .disclosureIndicator
        } else if indexPath.section == 1 {
            cell?.textLabel?.text = self.maskStyles[self.currentMaskStyleIndex].text
            cell?.accessoryType = .disclosureIndicator
        } else if indexPath.section == 2 {
            cell?.textLabel?.text = self.animationStyles[self.currentAnimationStyleIndex].text
            cell?.accessoryType = .disclosureIndicator
        } else if indexPath.section == 3 {
            cell?.textLabel?.text = self.actionTexts[indexPath.row]
        } else {
            if indexPath.row == 0 {
                cell?.textLabel?.text = "临时使用一次字体"
            } else {
                cell?.textLabel?.text = "临时使用一次自动消失时间"
            }
        }
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.section == 0 {
            self.pushSelectView(tag: 0, title: "选择动画显示/隐藏样式", data: self.animationShowStyles)
        } else if indexPath.section == 1 {
            self.pushSelectView(tag: 1, title: "选择遮罩样式", data: self.maskStyles)
        } else if indexPath.section == 2 {
            self.pushSelectView(tag: 2, title: "选择加载样式", data: self.animationStyles)
        } else if indexPath.section == 3 {
            if indexPath.row > 9 {
                YKProgressHUD.setEffectStyle(.extraLight)
            } else {
                YKProgressHUD.setEffectStyle(.dark)
            }
            if indexPath.row == 0 {
                YKProgressHUD.show()
                YKProgressHUD.dismiss(2.5)
            } else if indexPath.row == 1 {
                YKProgressHUD.show("正在拼命的加载中🏃🏃🏃")
                DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + .seconds(2), execute: {
                    DispatchQueue.main.async {
                        YKProgressHUD.dismiss()
                        YKProgressHUD.showInfo("加载完成😁😁😁")
                    }
                })
            } else if indexPath.row == 2 {
                Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.showProgressTimerHandler(timer:)), userInfo: nil, repeats: true)
            } else if indexPath.row == 3 {
                Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.showProgressTimerHandler(timer:)), userInfo: "上传中...", repeats: true)
            } else if indexPath.row == 4 {
                YKProgressHUD.showImage(UIImage(named: "image"))
            } else if indexPath.row == 5 {
                YKProgressHUD.showImage(UIImage(named: "image"), status: "图片会自动消失😏😏😏")
            } else if indexPath.row == 6 {
                YKProgressHUD.showInfo("Star 一下吧😙😙😙")
            } else if indexPath.row == 7 {
                YKProgressHUD.showSuccess("操作成功👏👏👏")
            } else if indexPath.row == 8 {
                YKProgressHUD.showError("出现错误了😢😢😢")
            } else if indexPath.row == 9 {
                YKProgressHUD.showMessage("开始使用 YKProgressHUD 吧")
            } else if indexPath.row == 10 {
                YKProgressHUD.showGif(gifUrl: Bundle.main.url(forResource: "loading", withExtension: "gif"), gifSize: 80)
                YKProgressHUD.dismiss(2)
            } else if indexPath.row == 11 {
                YKProgressHUD.showGif(gifUrl: Bundle.main.url(forResource: "loading", withExtension: "gif"), gifSize: 80, status: "正在拼命的加载中🏃🏃🏃")
                YKProgressHUD.dismiss(2)
            }
        } else if indexPath.section == 4 {
            if indexPath.row == 0 {
                YKProgressHUD.showMessage("临时使用一次字体", onlyOnceFont: UIFont.boldSystemFont(ofSize: 20))
            } else {
                YKProgressHUD.showMessage("临时使用一次自动消失时间：10秒",  autoDismissDelay: 10)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.headerTexts[section]
    }
    
    @objc func showProgressTimerHandler(timer: Timer) {
        if self.progressValue >= 100 {
            if timer.isValid {
                timer.invalidate()
            }
            YKProgressHUD.dismiss()
            self.progressValue = 0
        } else {
            self.progressValue += 5
            if let status = timer.userInfo {
                YKProgressHUD.showProgress(self.progressValue / 100, status: status as? String)
            } else {
                YKProgressHUD.showProgress(self.progressValue / 100)
            }
            
        }
    }
    
    func pushSelectView(tag: Int, title: String, data: [Any]) {
        let selectViewController = SelectViewController()
        selectViewController.tag = tag
        selectViewController.title = title
        selectViewController.data = data
        selectViewController.delegate = self
        self.navigationController?.pushViewController(selectViewController, animated: true)
    }
}

extension ViewController: SelectViewControllerDelegate {
    func selected(selectViewController: SelectViewController, selectIndex: Int) {
        if selectViewController.tag == 0 {
            self.currentAnimationShowStyleIndex = selectIndex
            YKProgressHUD.setAnimationShowStyle(self.animationShowStyles[self.currentAnimationShowStyleIndex].animationShowStyle)
        } else if selectViewController.tag == 1 {
            self.currentMaskStyleIndex = selectIndex
            YKProgressHUD.setMaskStyle(self.maskStyles[self.currentMaskStyleIndex].maskStyle)
        } else {
            self.currentAnimationStyleIndex = selectIndex
            YKProgressHUD.setAnimationStyle(self.animationStyles[self.currentAnimationStyleIndex].animationStyle)
        }
        self.tableView.reloadData()
    }
    func tableViewCellValue(selectViewController: SelectViewController, obj: Any) -> (text: String, isCheckmark: Bool) {
        if selectViewController.tag == 0 {
            let animationShowStyle = obj as! (text: String, animationShowStyle: YKProgressHUDAnimationShowStyle)
            return (text: animationShowStyle.text, isCheckmark: animationShowStyle.text == self.animationShowStyles[self.currentAnimationShowStyleIndex].text)
        } else if selectViewController.tag == 1 {
            let maskStyle = obj as! (text: String, maskStyle: YKProgressHUDMaskStyle)
            return (text: maskStyle.text, isCheckmark: maskStyle.text == self.maskStyles[self.currentMaskStyleIndex].text)
        } else {
            let animationStyle = obj as! (text: String, animationStyle: YKProgressHUDAnimationStyle)
            return (text: animationStyle.text, isCheckmark: animationStyle.text == self.animationStyles[self.currentAnimationStyleIndex].text)
        }
    }

}

