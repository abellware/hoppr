---
name: fmod-integration
overview: Replace all AudioStreamPlayer usage with FMOD event playback via FmodServer
createdAt: '2026-06-18T01:45:20.004Z'
todos:
  - id: audit-sounds
    content: Audit all AudioStreamPlayer usage in project scripts and scenes
    status: completed
  - id: sound-manager
    content: Create SoundManager autoload with FMOD event playback helpers
    status: completed
  - id: player-fmod
    content: 'Update player.gd to use FMOD for jump, squish, step, foley sounds'
    status: completed
  - id: sfx-fmod
    content: >-
      Update level scripts and orange/level_change_area to use FMOD for
      coin/orange SFX
    status: in_progress
  - id: music-fmod
    content: >-
      Update music playback in level_one.tscn and level_two.tscn to use FMOD
      music events
    status: pending
  - id: bank-loader
    content: Add FMOD bank loader and event constants
    status: completed
  - id: verify
    content: Verify project compiles and runs without errors
    status: pending
---
Audit all AudioStreamPlayer usage in the project, then create a SoundManager autoload that wraps FMOD playback. Update scripts to call the SoundManager instead of AudioStreamPlayer.play(), and add placeholder event paths matching the existing sound categories. Document the required FMOD Studio events for the user to build and export.
