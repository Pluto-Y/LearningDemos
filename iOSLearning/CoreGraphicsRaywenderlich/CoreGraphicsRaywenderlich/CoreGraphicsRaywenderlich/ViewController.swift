//
//  ViewController.swift
//  CoreGraphicsRaywenderlich
//
//  Created by Pluto-Y on 22/03/2017.
//  Copyright © 2017 Pluto-y. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var graphView: GraphView!
    @IBOutlet weak var medalView: MedalView!
    
    @IBOutlet weak var averageWaterDrunk: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    
    var isGraphShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkTotal()
        // Do any additional setup after loading the view, typically from a nib
    }
    
    func setupGraphDisplay() {
        // Use 7 days for graph - can use any number
        // but lable and sample data are set up for 7 days
        let noOfDays: Int = 7
        
        // 1 - replace last day with today's actual data
        graphView.graphPoints[graphView.graphPoints.count - 1] = counterView.counter
        
        // 2 - indicate that the graph needs to be rerawn
        graphView.setNeedsDisplay()
        
        maxLabel.text = "\(graphView.graphPoints.max() ?? 0)"
        
        // 3 - calculate average from graphPoints
        let average = CGFloat(graphView.graphPoints.reduce(0, +)) / CGFloat(graphView.graphPoints.count)
        averageWaterDrunk.text = "\(average)"
        
        // set up labels 
        // day of week label are set up in storyboard with tags
        // today is last day of the array need to go backward
        
        // 4 - get today's day number
        let dateFormatter = DateFormatter()
        let calendar = NSCalendar.current
        let componentOptions: Set<Calendar.Component> = [.weekday]
        let components = calendar.dateComponents(componentOptions, from: Date())
        
        var weekday = components.weekday ?? 0
        
        let days = ["S", "S", "M", "T", "W", "T", "F"]
        
        // 5 - set up the day name labels with corret day
        
        for i in (1...days.count).reversed() {
            if let labelView = graphView.viewWithTag(i) as? UILabel {
                if weekday == 7 {
                    weekday = 0
                }
                labelView.text = days[weekday]
                weekday -= 1
                if weekday < 0 {
                    weekday = days.count - 1
                }
            }
        }
    }

    @IBAction func pushBtnClick(_ button: PushButtonView) {
        if isGraphShowing {
            containerViewTap(nil)
        }
        if button.isAddButton {
            counterView.counter += 1
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        counterLbl.text = String(counterView.counter)
        checkTotal()
    }
    
    @IBAction func containerViewTap(_ gesture: UITapGestureRecognizer?) {
        
        if isGraphShowing {
            // hide Graph
            UIView.transition(from: graphView,
                              to: counterView,
                              duration: 1.0,
                              options: [.transitionFlipFromLeft, .showHideTransitionViews],
                              completion: nil)
        } else {
            setupGraphDisplay()
            UIView.transition(from: counterView,
                              to: graphView,
                              duration: 1.0,
                              options: [.transitionFlipFromRight, .showHideTransitionViews],
                              completion: nil)
        }
        isGraphShowing = !isGraphShowing
    }
    
    func checkTotal() {
        if counterView.counter >= 8 {
            medalView.showMedal(show: true)
        } else {
            medalView.showMedal(show: false)
        }
    }
}

