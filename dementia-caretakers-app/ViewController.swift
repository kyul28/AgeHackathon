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
    
    //Outlets for Habits
    @IBOutlet var labelForHabitsTitle: UILabel!
    @IBOutlet var labelForDepression: UILabel!
    @IBOutlet var labelForAgression: UILabel!
    @IBOutlet var labelForAnxiety: UILabel!
    @IBOutlet var labelForMemoryLoss: UILabel!
    @IBOutlet var labelForConfusion: UILabel!
    @IBOutlet var labelForMoodSwings: UILabel!
//    @IBOutlet var labelForWandering: UILabel!
//    @IBOutlet var labelForSuspicion: UILabel!
//    @IBOutlet var labelForDelusions: UILabel!
    //Habits Buttons
    @IBOutlet var checkboxDepression: UIButton!
    @IBOutlet var checkboxAgression: UIButton!
    @IBOutlet var checkboxAnxiety: UIButton!
    @IBOutlet var checkboxMemoryLoss: UIButton!
    @IBOutlet var checkboxConfusion: UIButton!
    @IBOutlet var checkboxMoodSwings: UIButton!



    //Loads ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        calendar.scrollEnabled = true
        enableSleepPage();
        disableDietPage();
        disableHabitsPage();
    }
    
    //Function for calendar, prints out the day of the week, date, month, year
    //Format: EEEE MM-dd-YYYY
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY"
        let string = formatter.string(from: date)
        print("\(string)")
    }
    
   
    //Function for segmented Control
    @IBAction func menuDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            enableSleepPage();
            disableDietPage();
            disableHabitsPage()
        case 1:
            disableSleepPage();
            disableHabitsPage();
            enableDietPage();
        case 2:
            disableSleepPage();
            disableDietPage();
            enableHabitsPage();
        default:
            disableDietPage();
            enableSleepPage();
            enableHabitsPage();
        }
    }
    
    //Returns value from slider
    @IBAction func sliderDidSlide(_ sender: UISlider) {
        let value = sender.value
        number.text = "\(value)"
    }
    
    //Enables the Sleep page
    func enableSleepPage() {
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
    
    //Disables the Sleep page
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
    
    //Enables the Diet Page
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
    
    //Disables the Diet page
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
    
    //Enables the Habits Page
    func enableHabitsPage() {
        //Habits Title
        labelForHabitsTitle.isEnabled = true;
        labelForHabitsTitle.alpha = 1;
        //Habits Depression
        labelForDepression.isEnabled = true;
        labelForDepression.alpha = 1;
        //Habits Agression
        labelForAgression.isEnabled = true;
        labelForAgression.alpha = 1;
        //Habits Anxiety
        labelForAnxiety.isEnabled = true;
        labelForAnxiety.alpha = 1;
        //Habits Memory Loss
        labelForMemoryLoss.isEnabled = true;
        labelForMemoryLoss.alpha = 1;
        //Habits Confusion
        labelForConfusion.isEnabled = true;
        labelForConfusion.alpha = 1;
        //Habits Mood Swings
        labelForMoodSwings.isEnabled = true;
        labelForMoodSwings.alpha = 1;
        //Habits Wandering
//        labelForWandering.isEnabled = true;
//        labelForWandering.alpha = 1;
//        //Habits Suspicion
//        labelForSuspicion.isEnabled = true;
//        labelForSuspicion.alpha = 1;
//        //Habits Delusions
//        labelForDelusions.isEnabled = true;
//        labelForDelusions.alpha = 1;
        
        //Checkboxes
        checkboxDepression.isEnabled = true;
        checkboxDepression.alpha = 1;
        checkboxAgression.isEnabled = true;
        checkboxAgression.alpha = 1;
        checkboxAnxiety.isEnabled = true;
        checkboxAnxiety.alpha = 1;
        checkboxMemoryLoss.isEnabled = true;
        checkboxMemoryLoss.alpha = 1;
        checkboxConfusion.isEnabled = true;
        checkboxConfusion.alpha = 1;
        checkboxMoodSwings.isEnabled = true;
        checkboxMoodSwings.alpha = 1;
        
    }
    
    //Disables the Habits Page
    func disableHabitsPage() {
        //Habits Title
        labelForHabitsTitle.isEnabled = false;
        labelForHabitsTitle.alpha = 0;
        //Habits Depression
        labelForDepression.isEnabled = false;
        labelForDepression.alpha = 0;
        //Habits Agression
        labelForAgression.isEnabled = false;
        labelForAgression.alpha = 0;
        //Habits Anxiety
        labelForAnxiety.isEnabled = false;
        labelForAnxiety.alpha = 0;
        //Habits Memory Loss
        labelForMemoryLoss.isEnabled = false;
        labelForMemoryLoss.alpha = 0;
        //Habits Confusion
        labelForConfusion.isEnabled = false;
        labelForConfusion.alpha = 0;
        //Habits Mood Swings
        labelForMoodSwings.isEnabled = false;
        labelForMoodSwings.alpha = 0;
//        //Habits Wandering
//        labelForWandering.isEnabled = false;
//        labelForWandering.alpha = 0;
        //Habits Suspicion
//        labelForSuspicion.isEnabled = false;
//        labelForSuspicion.alpha = 0;
//        //Habits Delusions
//        labelForDelusions.isEnabled = false;
//        labelForDelusions.alpha = 0;
        
        //Checkboxes
        checkboxDepression.isEnabled = false;
        checkboxDepression.alpha = 0;
        checkboxAgression.isEnabled = false;
        checkboxAgression.alpha = 0;
        
        checkboxAnxiety.isEnabled = false;
        checkboxAnxiety.alpha = 0;
        checkboxMemoryLoss.isEnabled = false;
        checkboxMemoryLoss.alpha = 0;
        checkboxConfusion.isEnabled = false;
        checkboxConfusion.alpha = 0;
        checkboxMoodSwings.isEnabled = false;
        checkboxMoodSwings.alpha = 0;
        
    }
        
    @IBAction func checkboxDepression(_ sender: UIButton) {
        checkboxDepression.setBackgroundImage(UIImage(systemName: "checkmark.circle.fill"), for: UIControl.State.normal)
    }
    
    @IBAction func checkboxAgression(_ sender: UIButton) {
        checkboxAgression.setBackgroundImage(UIImage(systemName: "checkmark.circle.fill"), for: UIControl.State.normal)
    }
    
    @IBAction func checkboxAnxiety(_ sender: UIButton) {
        checkboxAnxiety.setBackgroundImage(UIImage(systemName:"checkmark.circle.fill"), for: UIControl.State.normal)
    }
    
    @IBAction func checkboxMemoryLoss(_ sender: UIButton) {
        checkboxMemoryLoss.setBackgroundImage(UIImage(systemName:"checkmark.circle.fill"), for: UIControl.State.normal)
    }
    
    @IBAction func checkboxConfusion(_ sender: UIButton) {
        checkboxConfusion.setBackgroundImage(UIImage(systemName:"checkmark.circle.fill"), for: UIControl.State.normal)
    }
    
    @IBAction func checkboxMoodSwings(_ sender: UIButton) {
        checkboxMoodSwings.setBackgroundImage(UIImage(systemName:"checkmark.circle.fill"), for: UIControl.State.normal)
    }
        


}
