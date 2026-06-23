---
name: rubiks-cube-level
overview: Create a new level where the player runs over a tumbling Rubik's cube
createdAt: '2026-06-16T21:00:07.873Z'
todos:
  - id: rubiks-cube-image
    content: Generate a 2D Rubik's cube image asset for the level
    status: completed
  - id: rubiks-cube-scene-script
    content: Create rubiks_cube.tscn and rubiks_cube.gd with tumbling rotation behavior
    status: completed
  - id: level-three-scene
    content: >-
      Build level_three.tscn with background, ground, player, Rubik's cube, and
      apple goal
    status: completed
  - id: level-transition
    content: Update level_two.tscn to transition to level_three on completion
    status: completed
  - id: verify
    content: runAndVerify to confirm everything compiles and runs
    status: completed
---
## Rubik's Cube Level

### Rubik's Cube Design
- 2D image of a Rubik's cube (isometric view showing 3 faces with classic colors: red, blue, yellow, green, white, orange)
- Large sprite (256x256 or similar) scaled up in the scene

### Cube Behavior
- AnimatableBody2D with a child Sprite2D and CollisionShape2D
- Slow continuous rotation (tumbling effect) using _physics_process
- Moves slightly as it tumbles (like a rolling cube)
- The player can stand on and run across the rotating cube surface

### Level Structure
- Follows pattern from level_one.tscn and level_two.tscn
- Node2D root, background sprite, collision polygons for ground
- Player instance, Camera2D child
- Rubik's cube in center of level
- Apple/collectibles with level completion

### Transition
- level_two.tscn's apple handler already goes somewhere - need to check and update
- Wire level_two completion to load level_three
