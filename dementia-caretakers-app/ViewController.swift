//
//  ViewController.swift
//  dementia-caretakers-app
//
//  Created by May Jang on 2021-04-10.
//
import FSCalendar
import UIKit

class ViewController: UIViewController, FSCalendarDelegate {
    
    @IBOutlet var calendar: FSCalendar!
    @IBOutlet var label: UILabel!
    @IBOutlet var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        calendar.scrollEnabled = true
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY"
        let string = formatter.string(from: date)
        print("\(string)")
    }
    
   
    @IBAction func menuDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            slider.accessibilityActivate()
            _ = slider.isEnabled;
        case 1:
            print("hello")
        
        case 2:
            print("bye")
        default:
            print("hello everyone")
        }
        
    }
    
    @IBAction func sliderDidSlide(_ sender: UISlider) {
        let value = sender.value
        label.text = "\(value)"
    }
    
    
    

}
