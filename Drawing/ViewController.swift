//
//  ViewController.swift
//  Drawing
//


import Cocoa
import Tin


class ViewController: TController {

    override func viewWillAppear() {
        view.window?.title = "Drawing"
        makeView(width: 800.0, height: 600.0)
        let scene = Scene()
        present(scene: scene)
    }

}


class Scene: TScene {
    
    //
    // The update function is called to draw the view automatically.
    //
    override func update() {
        // background erases the view and sets the entire view to one flat
        // color. If you want a different background color, change it here.
        background(red: 0.478, green: 0.894, blue: 1.0) //light blue background
        
        // *************************************************
        // Insert your drawing code here, below this comment

        let defaultLineWidth = 10.0
        let black = 0.0
        let white = 1.0
        let blush = 50.0
        let noseWidth = 50.0, noseHeight = 30.0
        let outerBow = 105.0
        let innerBow = 45.0
        let shadowBow = 15.0
        let centerBow = 70.0
        let eyeWidth = 35.0, eyeHeight = 55.0
        let glint = 5.0
        let ratio = tin.mouseY / tin.height
        
        // INTERACTIVITY #1 HERE: When the mouse is moved, hello kitty's whiskers move too
        let whiskerTop = constrain(value: 295 + (ratio) * 30 , min: 280, max: 310)
        let whiskerMiddle = constrain(value: 240 + (ratio) * 30 , min: 225, max: 255)
        let whiskerBottom = constrain(value: 175 + (ratio) * 30, min: 160, max: 190)
        
        //frame around hello kitty
        lineWidth(50)
        fillDisable()
        strokeColor(red: 0.8, green: 0.5, blue: 0.2, alpha: 1) //light brown
        rect(x: 0, y: 0, width: tin.width, height: tin.height) //inner frame
        lineWidth(15)
        strokeColor(red: 0.7, green: 0.3, blue: 0.15, alpha: 1) //darker brown
        rect(x: 0, y: 0, width: tin.width, height: tin.height)
        lineWidth(defaultLineWidth)
        strokeColor(red: 0.7, green: 0.3, blue: 0.15, alpha: 1) //darker brown
        rect(x: 30, y: 30, width: tin.width - 55.0, height: tin.height - 55.0)
        
        
        //hello kitty's basic face shape
        lineWidth(defaultLineWidth)
        strokeColor(gray: black)
        fillColor(gray: white)
        ellipse(centerX: tin.midX, centerY: tin.midY, width: 500, height: 350)
        
        
        //hello kitty's ears
        lineWidth(defaultLineWidth)
        strokeColor(gray: black)
        fillColor(gray: white)
        triangle(x1: tin.midX - 200, y1: tin.midY + 95, x2: tin.midX - 190, 
                 y2: tin.midY + 190, x3: tin.midX - 95, y3: tin.midY + 150) //left ear
        triangle(x1: tin.midX + 200, y1: tin.midY + 95, x2: tin.midX + 190, 
                 y2: tin.midY + 190, x3: tin.midX + 95, y3: tin.midY + 150) //right ear
        
        
        //"erasing" the bottom line of the ear triangles on hello kitty's face
        strokeDisable()
        fillColor(gray: white)
        ellipse(centerX: tin.midX, centerY: tin.midY, width: 490, height: 340)
        
        
        //hello kitty's eyes
        fillColor(gray: black)
        ellipse(centerX: tin.midX - 125, centerY: tin.midY - 35, width: eyeWidth, height: eyeHeight) //left eye
        ellipse(centerX: tin.midX + 125, centerY: tin.midY - 35, width: eyeWidth, height: eyeHeight) //right eye
        strokeDisable()
        fillColor(gray: white)
        ellipse(centerX: tin.midX - 130, centerY: tin.midY - 20, width: glint, height: glint) //glint
        ellipse(centerX: tin.midX + 120, centerY: tin.midY - 20, width: glint, height: glint) //glint
    
        
        //hello kitty's nose
        lineWidth(defaultLineWidth)
        strokeColor(gray: black)
        fillColor(red: 0.949, green: 0.890, blue: 0.067, alpha: 1.0) //yellow
        ellipse(centerX: tin.midX, centerY: tin.midY - 75, width: noseWidth, height: noseHeight)
        
        
        //hello kitty's whiskers
        //left whiskers
        line(x1: 190, y1: 275, x2: 80, y2: whiskerTop)
        line(x1: 200, y1: 250, x2: 110, y2: whiskerMiddle)
        line(x1: 200, y1: 225, x2: 80, y2: whiskerBottom)
        
        //right whiskers
        line(x1: 610, y1: 275, x2: 720, y2: whiskerTop)
        line(x1: 600, y1: 250, x2: 690, y2: whiskerMiddle)
        line(x1: 600, y1: 225, x2: 720, y2: whiskerBottom)
        
        
        // INTERACTIVITY #2 HERE: When the moused is moved, the color of hello kitty's bow changes color basedon the
        // coordinates of the mouse's location
        //adding hello kitty's bow
        //base of the bow
        fillColor(red: 0.5, green: tin.mouseX/799, blue: tin.mouseY/599, alpha: 1.0) //main bow red
        ellipse(centerX: 480, centerY: 430, width: outerBow, height: outerBow)
        ellipse(centerX: 605, centerY: 380, width: outerBow, height: outerBow)
    
        //inner loops of bow
        fillColor(red: 0.7, green: tin.mouseX/799, blue: tin.mouseY/599, alpha: 1.0) //inner bow pink
        ellipse(centerX: 505, centerY: 420, width: innerBow, height: innerBow)
        ellipse(centerX: 575, centerY: 393, width: innerBow, height: innerBow)
        strokeDisable()
        fillColor(gray: 0.5) //shadow of bow
        ellipse(centerX: 505, centerY: 420, width: shadowBow, height: shadowBow)
        ellipse(centerX: 575, centerY: 393, width: shadowBow, height: shadowBow)
    
        //center of bow
        lineWidth(defaultLineWidth)
        strokeColor(gray: black)
        fillColor(red: 0.8, green: tin.mouseX/799, blue: tin.mouseY/599, alpha: 1.0) //center of bow
        ellipse(centerX: 540, centerY: 405, width: centerBow, height: centerBow)
        
        // INTERACTIVITY #3 HERE: When the mouse is pressed, the eyes turn into happy half moons
        // and hello kitty blushes
        if (tin.mousePressed)
        {
            fillColor(gray: white)
            ellipse(centerX: tin.midX - 125, centerY: tin.midY - 35, width: 50, height: 60) //make left eye happy shape
            ellipse(centerX: tin.midX + 125, centerY: tin.midY - 35, width: 50, height: 60) //make right eye happy shape
            
            strokeDisable()
            rect(x: 210, y: 200, width: 100, height: 75) //white out the lower portion of the left eye
            rect(x: 490, y: 200, width: 100, height: 75) //white out the lower portion of the right eye
            
            lineWidth(defaultLineWidth)
            fillColor(red: 0.996, green: 0.361, blue: 0.373, alpha: 0.2) //inner bow pink
            ellipse(centerX: tin.midX - 150, centerY: tin.midY - 75, width: blush, height: blush) //left blush
            ellipse(centerX: tin.midX + 150, centerY: tin.midY - 75, width: blush, height: blush) //left blush
        }
        
        
        // Your drawing code should be above this comment.
        // *************************************************
        
        
    }
    
}

