//
//  ViewController.swift
//  CacheArchive
//
//  Created by sseen on 16/6/17.
//  Copyright © 2016年 sseen. All rights reserved.
//
// code from 
// http://stackoverflow.com/questions/24238868/swift-nscoding-not-working

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let data = DataModel(name: "ssn", pass: "pass")
        data.save()
        let dataFetch = DataModel.loadSaved()
        print( dataFetch?.name )
        
        let dataNew = DataModel(name: "lo", pass: "pass")
        dataNew.save()
        let newFetch = DataModel.loadSaved()
        print( newFetch?.name )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

