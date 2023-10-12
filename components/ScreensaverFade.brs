'Change the background image to the next image
Function changeBackground() as Void
    'if (m.count=4)
    '    m.count = -1
    'end if
    'm.count += 1
    m.BackgroundArt.uri = m.pictures[RND(33)] 'image count + 1
End Function

'Start the FadeAnimation transition animation
Function FadeAnimation() as Void
    m.FadeAnimation.control = "start"
End Function

Function init()
	' For loop to load images
    m.pictures = []
	
	'Loads images in image folder
    for i = 1 to 69
        m.pictures.push("pkg:/images/" + i.toStr() +".jpg")
    end for 
    m.count = 0

	'Sets pointer to FadeAnimation node
    m.FadeAnimation = m.top.findNode("FadeAnimation")
	
	'Sets pointer to BackgroundArt node
    m.BackgroundArt = m.top.findNode("BackgroundArt")
	
	'Sets Background art to first picture
    m.BackgroundArt.uri = m.pictures[0]
   
   'field Observer that calls changeBackground() function everytime the value of SwapPhoto is changed
    m.global.observeField("SwapPhoto", "changeBackground")
	
	'field Observer that calls FadeAnimation() function everytime the value of FadeAnimate is changed
    m.global.observeField("FadeAnimate", "FadeAnimation")
End Function