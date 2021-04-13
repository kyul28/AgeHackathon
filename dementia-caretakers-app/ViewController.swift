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
    
    //Outlets for Sleep Page
    @IBOutlet var number: UILabel!
    @IBOutlet var labelForSleepQuality: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var labelForSleepHours: UILabel!
    @IBOutlet var textFieldSleepHours: UITextField!
    
    // Outlets for Diet Page
    @IBOutlet var textViewDietNotes: UITextView!
    //Energy
    @IBOutlet var labelForDietEnergy: UILabel!
    @IBOutlet var labelForDietKcal: UILabel!
    @IBOutlet var textFieldDietEnergy: UITextField!
    //Protein
    @IBOutlet var labelForDietProtein: UILabel!
    @IBOutlet var textFieldDietProtein: UITextField!
    @IBOutlet var labelForDietGram: UILabel!
    //Fluid Intake
    @IBOutlet var labelForDietFluidIntake: UILabel!
    @IBOutlet var textFieldDietFluidIntake: UITextField!
    @IBOutlet var labelForDietMl: UILabel!
    //Calcium
    @IBOutlet var labelForDietCalcium: UILabel!
    @IBOutlet var textFieldDietCalcium: UITextField!
    @IBOutlet var labelForDietMg: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        calendar.scrollEnabled = true
        enableSleepPage();
        disableDietPage();
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
            enableSleepPage();
            disableDietPage();
        case 1:
            disableSleepPage();
            enableDietPage();
            print("enabled diet page");
        case 2:
            disableSleepPage();
            disableDietPage();
        default:
            disableDietPage();
            enableSleepPage();
        }
        
    }
    
    @IBAction func sliderDidSlide(_ sender: UISlider) {
        let value = sender.value
        number.text = "\(value)"
    }
    
    func enableSleepPage() {
//        slider.accessibilityActivate()
        slider.isEnabled = true;
        slider.alpha = 1;
        number.isEnabled = true;
        number.alpha = 1;
        labelForSleepQuality.isEnabled = true;
        labelForSleepQuality.alpha = 1;
        labelForSleepHours.isEnabled = true;
        labelForSleepHours.alpha = 1;
        textFieldSleepHours.isEnabled = true;
        textFieldSleepHours.alpha = 1;
    }
    
    func disableSleepPage(){
        slider.isEnabled = false;
        slider.alpha = 0;
        number.isEnabled = false;
        number.alpha = 0;
        labelForSleepQuality.isEnabled = false;
        labelForSleepQuality.alpha = 0;
        labelForSleepHours.isEnabled = false;
        labelForSleepHours.alpha = 0;
        textFieldSleepHours.isEnabled = false;
        textFieldSleepHours.alpha = 0;
    }
    
    func enableDietPage() {
        //Additional Notes
        textViewDietNotes.isScrollEnabled = true;
        textViewDietNotes.alpha = 1;
        textViewDietNotes.isHidden = false;
        //Protein, gram
        labelForDietEnergy.isEnabled = true;
        labelForDietEnergy.alpha = 1;
        labelForDietKcal.isEnabled = true;
        labelForDietKcal.alpha = 1;
        textFieldDietEnergy.isEnabled = true;
        textFieldDietEnergy.alpha = 1;
        //Protein, g
        labelForDietProtein.isEnabled = true;
        labelForDietProtein.alpha = 1;
        labelForDietGram.isEnabled = true;
        labelForDietGram.alpha = 1;
        textFieldDietProtein.isEnabled = true;
        textFieldDietProtein.alpha = 1;
        //Fluid intake, mL
        labelForDietFluidIntake.isEnabled = true;
        labelForDietFluidIntake.alpha = 1;
        labelForDietMl.isEnabled = true;
        labelForDietMl.alpha = 1;
        textFieldDietFluidIntake.isEnabled = true;
        textFieldDietFluidIntake.alpha = 1;
        //Calcium, mg
        labelForDietCalcium.isEnabled = true;
        labelForDietCalcium.alpha = 1;
        labelForDietMg.isEnabled = true;
        labelForDietMg.alpha = 1;
        textFieldDietCalcium.isEnabled = true;
        textFieldDietCalcium.alpha = 1;


    }
    
    func disableDietPage() {
        //Additional Notes
        textViewDietNotes.alpha = 0;
        textViewDietNotes.isHidden = true;
        textViewDietNotes.isUserInteractionEnabled = false;
        //Energy, kcal
        labelForDietEnergy.isEnabled = false;
        labelForDietEnergy.alpha = 0;
        labelForDietKcal.isEnabled = false;
        labelForDietKcal.alpha = 0;
        textFieldDietEnergy.isEnabled = false;
        textFieldDietEnergy.alpha = 0;
        //Protein, g
        labelForDietProtein.isEnabled = false;
        labelForDietProtein.alpha = 0;
        labelForDietGram.isEnabled = false;
        labelForDietGram.alpha = 0;
        textFieldDietProtein.isEnabled = false;
        textFieldDietProtein.alpha = 0;
        //Fluid intake, mL
        labelForDietFluidIntake.isEnabled = false;
        labelForDietFluidIntake.alpha = 0;
        labelForDietMl.isEnabled = false;
        labelForDietMl.alpha = 0;
        textFieldDietFluidIntake.isEnabled = false;
        textFieldDietFluidIntake.alpha = 0;
        //Calcium, mg
        labelForDietCalcium.isEnabled = false;
        labelForDietCalcium.alpha = 0;
        labelForDietMg.isEnabled = false;
        labelForDietMg.alpha = 0;
        textFieldDietCalcium.isEnabled = false;
        textFieldDietCalcium.alpha = 0;




    }
    
    
    

}
