# Work Log

## Crystal

### 5/23

- Change Particle constructor so the mass and size of the particle will now be determined based on the period (on the periodic table) it is assigned
- Replace position- and speed-related int variables in Particle with PVectors
- Made particle move and collide with the wall
- Adjust coloring of the background, particles, and box 
- Move method calls around in GasSim to produce intended animations

### 5/24
- Trying my best with collisions...........

### 5/25
- Made collisions work kind of but still suboptimal
- Working on implementing delay for collisions
- Adjust spawn point to accommodate for larger particle sizes

### 5/26
- Ton of collision optimizations -- most importantly particle-particle collision no longer buggy
- Also hyper(?)optimize particle-wall collisions
- Randomize velocity of newly spawned particles
- Combine parts of move() and wallCollide() because they check for same conditions

### 5/30
- Add methods to calculate V and T (relatively simple)
- Add method to calculate P based on impulse of total collisions in a given time frame
- Display variables
- Work on barometer visual for interface


### 5/31
- Finish barometer visual (still needs some minor tweaks)
- Differentiate particles of different elements 
- Starting to add interface for adding and removing particles


### 6/1
- Finish interface for adding and removing particles

### 6/4
- Drew painstakingly detailed thermometer
- Display dynamic temperature through thermometer


### 6/5
- Start implementing feature for holding variables constants-began with T
- Add method for adjusting temperature by multiplying kinetic energies of each particle


### 6/6
- Work on holding temperature constant

### 6/9
- Make newly initialized particles consistent with current temperature of container so behavior aligns with PhET simulation--also streamlines keeping temperature constant 

### 6/10
- Display temperature and pressure values underneath their respective tools
- Fix bug with initializing particles with the container temperature
- Make volume handle disappear when volume is being held constant
- Create popups for messages when volume reaches limits while pressure is being held constant when Pressure(V) is selected
- Made slideable lid that allows for particles to leave the container and change container variables accordingly
- Work on Pressure(T)

### 6/11
- Made adjusting temperature feature look and work better
- Add pause, fast forward, and reset buttons + pause when volume is being adjusted
- Make position of particles change proportionally to container width changes
- Adjust size of particles to make gas law more accurate (negligible volume) and also solve problem of negative volume when volume of particles is greater than volume of container
- Adjust masses of particles to be proportional to volume to balance out PV = NRT and make the constant R more constant
- Made animation for lid falling off when pressure gets too high
- Ensure pressure is stable before using it in calculations or allowing it to be held constant--not as smooth but most importantly less spazzes and fluctuations and outright bugs

## Natalie

### 5/23
- create classes and write base of classes
- start figuring out buttons and resizing for shapes
- drafted up unfinished rectangle(container) resizing(does not work)

### 5/24
- made button to spawn more particles from a specific side of the container
- only spawns one particle everytime button is pressed when it should spawn(will fix)
- found error in wall collision for when particle is spawned on the wall

### 5/25
- made button to do resizing
- made function to make the box change size
- function is glitchy but is good placehlder for now

### 5/26/23
- designed control box
- tried to fix resize (again)

### 5/28/23
- made buttons, added variables (mostly booleans), made buttons switch

### 5/29/23
- restarted resize and got rid of dragged, tried to get separate lines and make a toggle method (didn't not succeed)

### 5/30/23 & 5/31/23
- worked on resize again, did not work

### 6/3/23
- reszie works

### 6/7/23
- made and tested button for lid
- started working on rotating lid as it falls off (flawed)

### 6/9/23
- added graphics to temperature controller(slightly glitchy and slow will fix)
- kept working on lid falling off

### 6/10/23
- worked on lid some more TnT

### 6/11/23
- deleted unneccesary files
- added units to display and resized parts of it
- did readme file and some of dev log
- tried to calculate lid limits (did not work) with lid opening max


# Dev Log
## Working features
- Container resizing
- Lid slider (so particles can escape to the surroundings)
  = lid popping off animation when pressure is too high
- Particle-particle collisions and particle-wall/container collisions
- Pressure barometer display
- Temperature thermometer display
- Particle pump
- Three different particles
- Ability to add and remove particles in increments of one and ten
- Manual temperature change with graphics
- Holding factors constant
  = Nothing 
  = Volume
  = Temperature
  = Pressure V (container changes itself)
  = Pressure T

## Broken Features/Bugs

## Content Resources
- Processing reference
- Simple Linear Gradient / Examples / Processing.org (https://processing.org/examples/lineargradient.html)
- Elastic collision - Wikipedia (https://en.wikipedia.org/wiki/Elastic_collision)
- inspiration for project https://phet.colorado.edu/sims/html/gas-properties/latest/gas-properties_all.html




