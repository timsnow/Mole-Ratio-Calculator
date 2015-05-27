//
//  ViewController.swift
//  Mole Ratio Calculator
//
//  Created by Tim Snow on 25/05/2015.
//  Copyright (c) 2015 Tim Snow. All rights reserved.
//


import Cocoa


class ViewController: NSViewController, NSTextFieldDelegate  {

    
    // Declare all the inputs from the storyboard
    @IBOutlet weak var aRatioInputField: NSTextField!
    @IBOutlet weak var bRatioInputField: NSTextField!
    @IBOutlet weak var cRatioInputField: NSTextField!
    @IBOutlet weak var dRatioInputField: NSTextField!
    @IBOutlet weak var aMWeightInputField: NSTextField!
    @IBOutlet weak var bMWeightInputField: NSTextField!
    @IBOutlet weak var cMWeightInputField: NSTextField!
    @IBOutlet weak var dMWeightInputField: NSTextField!
    @IBOutlet weak var aMassInputField: NSTextField!
    @IBOutlet weak var bMassInputField: NSTextField!
    @IBOutlet weak var cMassInputField: NSTextField!
    @IBOutlet weak var dMassInputField: NSTextField!
    @IBOutlet weak var aMolarityInputField: NSTextField!
    @IBOutlet weak var bMolarityInputField: NSTextField!
    @IBOutlet weak var cMolarityInputField: NSTextField!
    @IBOutlet weak var dMolarityInputField: NSTextField!

    // Declare all the outputs to the storyboard
    @IBOutlet weak var aMolarityLabel: NSTabView!
    @IBOutlet weak var bMolarityLabel: NSTabView!
    @IBOutlet weak var cMolarityLabel: NSTabView!
    @IBOutlet weak var dMolarityLabel: NSTabView!
    @IBOutlet weak var aMassLabel: NSTextField!
    @IBOutlet weak var bMassLabel: NSTextField!
    @IBOutlet weak var cMassLabel: NSTextField!
    @IBOutlet weak var dMassLabel: NSTextField!
    
    // Declare and initialise some variables for this class, there's quite a few...
    var ratioA: Float = 0, ratioB: Float = 0, ratioC: Float = 0, ratioD: Float = 0
    var mwA: Float = 0, mwB: Float = 0, mwC: Float = 0, mwD: Float = 0
    var massA: Float = 0, massB: Float = 0, massC: Float = 0, massD: Float = 0
    var molarityA: Float = 0, molarityB: Float = 0, molarityC: Float = 0, molarityD: Float = 0
    
    
    // If the view loaded, let's initialise with some default values and start listening...
    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Start listening and set the default values
        aRatioInputField.delegate = self
        aRatioInputField.stringValue = "1"
        bRatioInputField.delegate = self
        bRatioInputField.stringValue = "1"
        cRatioInputField.delegate = self
        cRatioInputField.stringValue = "1"
        dRatioInputField.delegate = self
        dRatioInputField.stringValue = "1"
        aMWeightInputField.delegate = self
        aMWeightInputField.stringValue = "1"
        bMWeightInputField.delegate = self
        bMWeightInputField.stringValue  = "1"
        cMWeightInputField.delegate = self
        cMWeightInputField.stringValue = "1"
        dMWeightInputField.delegate = self
        dMWeightInputField.stringValue = "1"
        aMassInputField.delegate = self
        aMassInputField.stringValue = "1"
        bMassInputField.delegate = self
        bMassInputField.stringValue = "1"
        cMassInputField.delegate = self
        cMassInputField.stringValue = "1"
        dMassInputField.delegate = self
        dMassInputField.stringValue = "1"
        aMolarityInputField.delegate = self
        aMolarityInputField.stringValue = "1"
        bMolarityInputField.delegate = self
        bMolarityInputField.stringValue = "1"
        cMolarityInputField.delegate = self
        cMolarityInputField.stringValue = "1"
        dMolarityInputField.delegate = self
        dMolarityInputField.stringValue = "1"

        // Update the labels with some calculated values
        molFromMass()
        massFromMol()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
            
        }
    }

   override func controlTextDidChange (notification: NSNotification) {
        // Listen for NSNotifications when the input field values change and handle them
        if  (notification.object?.description == aMassInputField.description) || (notification.object?.description == bMassInputField.description) || (notification.object?.description == cMassInputField.description) || (notification.object?.description == dMassInputField.description) {
            molFromMass()
        } 
        else if (notification.object?.description == aMolarityInputField.description) || (notification.object?.description == bMolarityInputField.description) || (notification.object?.description == cMolarityInputField.description) || (notification.object?.description == dMolarityInputField.description) {
            massFromMol()
        }
        else {
            molFromMass()
            massFromMol()
       }
    }

    func molFromMass() {
        // Do some maths based on the user input
        // Start by getting the values from the input fields and converting them to floats
        updateValuesFromUI()
        
    }

    func massFromMol() {
        // Do some maths based on the user input
        // Start by getting the values from the input fields and converting them to floats
        updateValuesFromUI()
        
    }

    
    func updateValuesFromUI(){
        // Get all the values from the UI and update their corresponsing values here
        self.ratioA = (aRatioInputField.stringValue as NSString).floatValue
        self.ratioB = (bRatioInputField.stringValue as NSString).floatValue
        self.ratioC = (cRatioInputField.stringValue as NSString).floatValue
        self.ratioD = (dRatioInputField.stringValue as NSString).floatValue
        self.mwA = (aMWeightInputField.stringValue as NSString).floatValue
        self.mwB = (bMWeightInputField.stringValue as NSString).floatValue
        self.mwC = (cMWeightInputField.stringValue as NSString).floatValue
        self.mwD = (dMWeightInputField.stringValue as NSString).floatValue
        self.massA = (aMassInputField.stringValue as NSString).floatValue
        self.massB = (bMassInputField.stringValue as NSString).floatValue
        self.massC = (cMassInputField.stringValue as NSString).floatValue
        self.massD = (dMassInputField.stringValue as NSString).floatValue
        self.molarityA = (aMolarityInputField.stringValue as NSString).floatValue
        self.molarityB = (bMolarityInputField.stringValue as NSString).floatValue
        self.molarityC = (cMolarityInputField.stringValue as NSString).floatValue
        self.molarityD = (dMolarityInputField.stringValue as NSString).floatValue
    }
}

