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
    @IBOutlet var number: UILabel!
    @IBOutlet var labelForSleepQuality: UILabel!
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
            slider.isEnabled = true;
            slider.alpha = 1;
            number.isEnabled = true;
            number.alpha = 1;
            labelForSleepQuality.isEnabled = true;
            labelForSleepQuality.alpha = 1;
        case 1:
            print("hello")
            slider.isEnabled = false;
            slider.alpha = 0;
            number.isEnabled = false;
            number.alpha = 0;
            labelForSleepQuality.isEnabled = false;
            labelForSleepQuality.alpha = 0;
        case 2:
            print("bye")
            slider.isEnabled = false;
            slider.alpha = 0;
            number.isEnabled = false;
            number.alpha = 0;
            labelForSleepQuality.isEnabled = false;
            labelForSleepQuality.alpha = 0;
        default:
            print("hello everyone")
        }
        
    }
    
    @IBAction func sliderDidSlide(_ sender: UISlider) {
        let value = sender.value
        number.text = "\(value)"
    }
    
    
    

}
