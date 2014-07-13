#DOMAIN MODEL / Brief

Imagine you're writing software to control the flow of **planes** at an **airport**. The planes can *land* and *take off* provided that the **weather** is *sunny*. Occasionally it may be *stormy*, in which case no planes can land or take off.

Your task is to create a set of classes/modules to makes the given test suite pass. You will need to use random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a double to override random weather. Finally, every plane must have a status indicating whether it's flying or landed. You may expand on the original tests.

# CRC
###Planes
| **Responsibility** | Collaborators 					 |
| ------------------ | --------------------------------- |
| take off 			 | from airport, if weather is sunny |
| fly 				 | - 								 |
| land				 | in airport, if weather is sunny   |

###Airport
| **Responsibility** | Collaborators 					 |
| ------------------ | --------------------------------- |
| allow landing 	 | for a plane, if weather is sunny  |
| allow take off	 | for a plane, if weather is sunny  |
| prevent landing	 | for a plane, if weather is stormy |
| prevent takeoff	 | for a plane, if weather is stormy |

###Weather
| **Responsibility** 	  | Collaborators |
| ----------------------- | ------------- |
| be sunny 				  | - 			  |
| be stormy occassionally | - 			  |


# important things
```````````````````````````

              -=\`\
          |\ ____\_\__
        -=\c`""""""" "`)
           `~~~~~/ /~~`
             -==/ /
               '-'

  ______________\`\______________
          |\ ____\_\__
  --------\c`""""""" "`)---------
           `-----/ /--`
  _____________ / /______________
               '-'
 © http://www.asciiworld.com/-Planes-.html :)
 ```````````````````````````