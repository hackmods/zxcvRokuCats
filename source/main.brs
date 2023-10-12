'* Copyright (c) 2032 Hackmods Inc. All rights reserved.
'
' File: main.brs
'

' This is the function called by the Roku device to start this channel
sub RunScreenSaver()
    screen = createObject("roSGScreen")
    port = createObject("roMessagePort")
    port2 =  createObject("roMessagePort")
    screen.setMessagePort(port)

	'Creates (Global) variable FadeAnimate
    m.global = screen.getGlobalNode()
    m.global.AddField("FadeAnimate", "int", true)
    m.global.FadeAnimate = 0
	
	'Creates (Global) variable SwapPhoto
    m.global.AddField("SwapPhoto", "int", true)
    m.global.SwapPhoto = 0

	'Creates scene ScreensaverFade
    scene = screen.createScene("ScreensaverFade")
    screen.show()

	'Message Port that fires every 5 seconds to change value of FadeAnimate if the screen is open
     while(true)
        msg = wait(5000, port)
        if (msg <> invalid)
            msgType = type(msg)
			
            if msgType = "roSGScreenEvent"
                if msg.isScreenClosed() then return
            end if
        else
            m.global.FadeAnimate += 10
            
			'Message port that fires 2.5 seconds after FadeAnimate is changed. Must be set to different port than other wait function or it will interfere.
			msg = wait(2500, port2)
            
			m.global.SwapPhoto += 10
        end if
    end while
end sub
