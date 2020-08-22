import pyttsx3
import os
pyttsx3.speak("Hello Navin Welcome to the future. Jarvis will do whatever you want ")
flag = True
while flag:
    print("Tell me what do you want to run : " , end='')
    x = input()
    if ("don't"in x) or ("dont" in x):
        continue

    # chrome
    elif (("run" in x) or ("open" in x) or ("launch" in x)) and ("chrome" in x):
        if (("bg" in x) or ("background" in x)):
            pyttsx3.speak("Chrome can't be opened in background")
            pyttsx3.speak("Next requirement please")
        else:
            pyttsx3.speak("Sir you requested me to open google chrome")
            os.system("chrome youtube")
            pyttsx3.speak("Next requirement please")

            #  wmplayer 
    elif (("run" in x) or ("open" in x) or ("launch" in x)) and (("media" in x) or ("wmp" in x) or ("wmplayer"in x)):
        if (("bg" in x) or ("background" in x)):
            pyttsx3.speak("Sir you requested me to open windows media player in backgroung")
            os.system("wmplayer")
            pyttsx3.speak("Next requirement please")
        else:
            pyttsx3.speak("Sir you requested me to open windows media player")
            os.system("wmplayer")
            pyttsx3.speak("Next requirement please")


            # vlc player
    elif (("run" in x) or ("open" in x) or ("launch" in x)) and (("vlc" in x) or ("vlc player" in x)):
        if (("bg" in x) or ("background" in x)):
            pyttsx3.speak("Sir you requested me to open vlc player in backgroung")
            os.system("vlc")
            pyttsx3.speak("Next requirement please")
        else:
            pyttsx3.speak("Sir you requested me to open vlc player")
            os.system("vlc")
            pyttsx3.speak("Next requirement please")

        # Exit
    elif ("exit" in x)  or ("quit" in x):
        flag = False

        #  Not installed
    else:
        pyttsx3.speak("This Software in not installed")
        pyttsx3.speak("Next requirement please")


else:
    pyttsx3.speak("Thank You Navin. hope you enjoyed your future. Please come back Again")
    
