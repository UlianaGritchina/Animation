//
//  ViewController.swift
//  Animation
//
//  Created by Ульяна Гритчина on 26.01.2022.
//

import Spring

class ViewController: UIViewController {
    
    @IBOutlet var animationView: SpringView!
    
    @IBOutlet var animationButton: UIButton!
    
    @IBOutlet var animationName: UILabel!
    @IBOutlet var forceLable: UILabel!
    @IBOutlet var durationLable: UILabel!
    @IBOutlet var delayLable: UILabel!
    
    private var animations = ["pop", "shake", "morph", "squeeze", "wobble"]
    private var animation = Animation(
        name: "pop",
        force: Float.random(in: 1...3),
        delay:  Float.random(in: 0...1),
        dutation:  Float.random(in: 1...3)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView.layer.cornerRadius = 10
        animationButton.layer.cornerRadius = 10
        
        animationName.text = animation.name
        forceLable.text = String(format: "%.2f", animation.force)
        durationLable.text = String(format: "%.2f", animation.dutation)
        delayLable.text = String(format: "%.2f", animation.delay)
    }

    @IBAction func start(_ sender: UIButton) {
        
        animationName.text = animation.name
        forceLable.text = String(format: "%.2f", animation.force)
        durationLable.text = String(format: "%.2f", animation.dutation)
        delayLable.text = String(format: "%.2f", animation.delay)
        
        animationView.animation = animation.name
        animationView.delay = CGFloat(animation.delay)
        animationView.duration = CGFloat(animation.dutation)
        
        animationView.animate()
        
        animation.name = animations.randomElement() ?? "pop"
        animation.force = Float.random(in: 1...3)
        animation.delay = Float.random(in: 0...1)
        animation.dutation = Float.random(in: 1...3)
        
        sender.setTitle(animation.name, for: .normal)
    }
}

