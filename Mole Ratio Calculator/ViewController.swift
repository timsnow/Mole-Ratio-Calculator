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
    @IBOutlet weak var aMolarityLabel: NSTextField!
    @IBOutlet weak var bMolarityLabel: NSTextField!
    @IBOutlet weak var cMolarityLabel: NSTextField!
    @IBOutlet weak var dMolarityLabel: NSTextField!
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
        aMassInputField.stringValue = "0"
        bMassInputField.delegate = self
        bMassInputField.stringValue = "0"
        cMassInputField.delegate = self
        cMassInputField.stringValue = "0"
        dMassInputField.delegate = self
        dMassInputField.stringValue = "0"
        aMolarityInputField.delegate = self
        aMolarityInputField.stringValue = "0"
        bMolarityInputField.delegate = self
        bMolarityInputField.stringValue = "0"
        cMolarityInputField.delegate = self
        cMolarityInputField.stringValue = "0"
        dMolarityInputField.delegate = self
        dMolarityInputField.stringValue = "0"

        // Update the labels with some calculated values
        // Errr...
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
            
        }
    }

   override func controlTextDidChange (notification: NSNotification) {
        // Listen for NSNotifications when the input field values change and handle them
        if (notification.object?.description == aRatioInputField.description) || (notification.object?.description == aMWeightInputField.description) || (notification.object?.description == aMassInputField.description) || (notification.object?.description == aMolarityInputField.description) {
            calculateFromA()
        }
        else if (notification.object?.description == bRatioInputField.description) || (notification.object?.description == bMWeightInputField.description) || (notification.object?.description == bMassInputField.description) || (notification.object?.description == bMolarityInputField.description) {
            calculateFromB()
        }
        else if (notification.object?.description == cRatioInputField.description) || (notification.object?.description == cMWeightInputField.description) || (notification.object?.description == cMassInputField.description) || (notification.object?.description == cMolarityInputField.description) {
            calculateFromC()
        }
        else if (notification.object?.description == dRatioInputField.description) || (notification.object?.description == dMWeightInputField.description) || (notification.object?.description == dMassInputField.description) || (notification.object?.description == dMolarityInputField.description) {
            calculateFromD()
        }
    }

    func calculateFromA() {
        // Do some maths based on the user input
        // Start by getting the values from the input fields and converting them to floats
        updateValuesFromUI()
        
        // First for masses
        // Work out values
        var aInMol = self.massA / self.mwA
        var universalMol = aInMol / self.ratioA
        var bInMol = universalMol * ratioB
        var bAsMass = bInMol * self.mwB
        var cInMol = universalMol * ratioC
        var cAsMass = cInMol * self.mwC
        var dInMol = universalMol * ratioD
        var dAsMass = dInMol * self.mwD
        // Set values
        aMolarityLabel.stringValue = String(format: "%5.3f", aInMol)
        bMolarityLabel.stringValue = String(format: "%5.3f", bInMol)
        cMolarityLabel.stringValue = String(format: "%5.3f", cInMol)
        dMolarityLabel.stringValue = String(format: "%5.3f", dInMol)
        bMassInputField.stringValue = String(format: "%5.3f", bAsMass)
        cMassInputField.stringValue = String(format: "%5.3f", cAsMass)
        dMassInputField.stringValue = String(format: "%5.3f", dAsMass)
        
        // Then for molarities
        // Work out values
        universalMol = self.molarityA / self.ratioA
        var aAsMass = self.molarityA * self.mwA
        bInMol = universalMol * ratioB
        bAsMass = bInMol * self.mwB
        cInMol = universalMol * ratioC
        cAsMass = cInMol * self.mwC
        dInMol = universalMol * ratioD
        dAsMass = dInMol * self.mwD
        // Set values
        aMassLabel.stringValue = String(format: "%5.3f", aAsMass)
        bMassLabel.stringValue = String(format: "%5.3f", bAsMass)
        cMassLabel.stringValue = String(format: "%5.3f", cAsMass)
        dMassLabel.stringValue = String(format: "%5.3f", dAsMass)
        bMolarityInputField.stringValue = String(format: "%5.3f", bInMol)
        cMolarityInputField.stringValue = String(format: "%5.3f", cInMol)
        dMolarityInputField.stringValue = String(format: "%5.3f", dInMol)
    }

    func calculateFromB() {
        // Do some maths based on the user input
        // Start by getting the values from the input fields and converting them to floats
        updateValuesFromUI()
        
        // First for masses
        // Work out values
        var bInMol = self.massB / self.mwB
        var universalMol = bInMol / self.ratioB
        var aInMol = universalMol * ratioA
        var aAsMass = aInMol * self.mwA
        var cInMol = universalMol * ratioC
        var cAsMass = cInMol * self.mwC
        var dInMol = universalMol * ratioD
        var dAsMass = dInMol * self.mwD
        // Set values
        aMolarityLabel.stringValue = String(format: "%5.3f", aInMol)
        bMolarityLabel.stringValue = String(format: "%5.3f", bInMol)
        cMolarityLabel.stringValue = String(format: "%5.3f", cInMol)
        dMolarityLabel.stringValue = String(format: "%5.3f", dInMol)
        aMassInputField.stringValue = String(format: "%5.3f", aAsMass)
        cMassInputField.stringValue = String(format: "%5.3f", cAsMass)
        dMassInputField.stringValue = String(format: "%5.3f", dAsMass)
        
        // Then for molarities
        // Work out values
        universalMol = self.molarityB / self.ratioB
        var bAsMass = self.molarityB * self.mwB
        aInMol = universalMol * ratioA
        aAsMass = aInMol * self.mwA
        cInMol = universalMol * ratioC
        cAsMass = cInMol * self.mwC
        dInMol = universalMol * ratioD
        dAsMass = dInMol * self.mwD
        // Set values
        aMassLabel.stringValue = String(format: "%5.3f", aAsMass)
        bMassLabel.stringValue = String(format: "%5.3f", bAsMass)
        cMassLabel.stringValue = String(format: "%5.3f", cAsMass)
        dMassLabel.stringValue = String(format: "%5.3f", dAsMass)
        aMolarityInputField.stringValue = String(format: "%5.3f", aInMol)
        cMolarityInputField.stringValue = String(format: "%5.3f", cInMol)
        dMolarityInputField.stringValue = String(format: "%5.3f", dInMol)
        
    }

    func calculateFromC() {
        // Do some maths based on the user input
        // Start by getting the values from the input fields and converting them to floats
        updateValuesFromUI()
        
        // First for masses
        // Work out values
        var cInMol = self.massC / self.mwC
        var universalMol = cInMol / self.ratioC
        var bInMol = universalMol * ratioB
        var bAsMass = bInMol * self.mwB
        var aInMol = universalMol * ratioA
        var aAsMass = aInMol * self.mwA
        var dInMol = universalMol * ratioD
        var dAsMass = dInMol * self.mwD
        // Set values
        aMolarityLabel.stringValue = String(format: "%5.3f", aInMol)
        bMolarityLabel.stringValue = String(format: "%5.3f", bInMol)
        cMolarityLabel.stringValue = String(format: "%5.3f", cInMol)
        dMolarityLabel.stringValue = String(format: "%5.3f", dInMol)
        bMassInputField.stringValue = String(format: "%5.3f", bAsMass)
        aMassInputField.stringValue = String(format: "%5.3f", aAsMass)
        dMassInputField.stringValue = String(format: "%5.3f", dAsMass)
        
        // Then for molarities
        // Work out values
        universalMol = self.molarityC / self.ratioC
        var cAsMass = self.molarityC * self.mwC
        bInMol = universalMol * ratioB
        bAsMass = bInMol * self.mwB
        aInMol = universalMol * ratioA
        aAsMass = aInMol * self.mwA
        dInMol = universalMol * ratioD
        dAsMass = dInMol * self.mwD
        // Set values
        aMassLabel.stringValue = String(format: "%5.3f", aAsMass)
        bMassLabel.stringValue = String(format: "%5.3f", bAsMass)
        cMassLabel.stringValue = String(format: "%5.3f", cAsMass)
        dMassLabel.stringValue = String(format: "%5.3f", dAsMass)
        bMolarityInputField.stringValue = String(format: "%5.3f", bInMol)
        aMolarityInputField.stringValue = String(format: "%5.3f", aInMol)
        dMolarityInputField.stringValue = String(format: "%5.3f", dInMol)
    }

    func calculateFromD() {
        // Do some maths based on the user input
        // Start by getting the values from the input fields and converting them to floats
        updateValuesFromUI()
        
        // First for masses
        // Work out values
        var dInMol = self.massD / self.mwD
        var universalMol = dInMol / self.ratioD
        var bInMol = universalMol * ratioB
        var bAsMass = bInMol * self.mwB
        var cInMol = universalMol * ratioC
        var cAsMass = cInMol * self.mwC
        var aInMol = universalMol * ratioA
        var aAsMass = aInMol * self.mwA
        // Set values
        aMolarityLabel.stringValue = String(format: "%5.3f", aInMol)
        bMolarityLabel.stringValue = String(format: "%5.3f", bInMol)
        cMolarityLabel.stringValue = String(format: "%5.3f", cInMol)
        dMolarityLabel.stringValue = String(format: "%5.3f", dInMol)
        bMassInputField.stringValue = String(format: "%5.3f", bAsMass)
        cMassInputField.stringValue = String(format: "%5.3f", cAsMass)
        aMassInputField.stringValue = String(format: "%5.3f", aAsMass)
        
        // Then for molarities
        // Work out values
        universalMol = self.molarityD / self.ratioD
        var dAsMass = self.molarityD * self.mwD
        bInMol = universalMol * ratioB
        bAsMass = bInMol * self.mwB
        cInMol = universalMol * ratioC
        cAsMass = cInMol * self.mwC
        aInMol = universalMol * ratioA
        aAsMass = aInMol * self.mwA
        // Set values
        aMassLabel.stringValue = String(format: "%5.3f", aAsMass)
        bMassLabel.stringValue = String(format: "%5.3f", bAsMass)
        cMassLabel.stringValue = String(format: "%5.3f", cAsMass)
        dMassLabel.stringValue = String(format: "%5.3f", dAsMass)
        bMolarityInputField.stringValue = String(format: "%5.3f", bInMol)
        cMolarityInputField.stringValue = String(format: "%5.3f", cInMol)
        aMolarityInputField.stringValue = String(format: "%5.3f", aInMol)
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

