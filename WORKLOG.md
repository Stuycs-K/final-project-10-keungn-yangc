# Work Log

## GROUP MEMBER 1

### 5/23

info

### date y

info


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

info

## Natalie

### 5/23
- create classes and write base of classes
- start figuring out buttons and resizing for shapes
- drafted up unfinished rectangle(container) resizing(does not work)


## Natalie

### 5/24
- made button to spawn more particles from a specific side of the container
- only spawns one particle everytime button is pressed when it should spawn(will fix)
- found error in wall collision for when particle is spawned on the wall

## Natalie

### 5/25
- made button to do resizing
- made function to make the box change size
- function is glitchy but is good placehlder for now





