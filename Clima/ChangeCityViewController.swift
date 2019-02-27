//Drew helped me with the switch



import UIKit


//Write the protocol declaration here:
protocol ChangeCityDelegate {
    func userEnteredANewCityName(city: String)
    func userWantsPressure(pressureOn: Bool)
}


class ChangeCityViewController: UIViewController {
    
    var preSwitchSetting = false
    var delegate : ChangeCityDelegate?
    
    
    
    //This is the pre-linked IBOutlets to the text field:
    @IBOutlet weak var changeCityTextField: UITextField!
    
    @IBOutlet weak var `switch`: UISwitch!
    
    //This is the IBAction that gets called when the user taps on the "Get Weather" button:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        `switch`.isOn = preSwitchSetting
    }
    
    @IBAction func getWeatherPressed(_ sender: AnyObject) {
        
        let cityName = changeCityTextField.text!
        
        delegate?.userEnteredANewCityName(city: cityName)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func pressureSwitch(_ sender: UISwitch) {
        // Tell the delegate that user has switched the preference
        delegate?.userWantsPressure(pressureOn: sender.isOn)
    }
    
    
    //This is the IBAction that gets called when the user taps the back button. It dismisses the ChangeCityViewController.
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

