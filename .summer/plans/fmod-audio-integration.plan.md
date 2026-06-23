---
name: fmod-audio-integration
overview: Replace all AudioStreamPlayer usage with FMOD event playback via SoundManager
createdAt: '2026-06-18T08:37:18.995Z'
todos:
  - id: player-gd-fmod
    content: Replace AudioStreamPlayer playback in player.gd with SoundManager calls
    status: completed
  - id: player-tscn-fmod
    content: Strip AudioStreamPlayer nodes from player.tscn
    status: completed
  - id: level-one-music-fmod
    content: Replace music AudioStreamPlayer in level_one.tscn with SoundManager call
    status: completed
  - id: level-two-fmod
    content: Replace AudioStreamPlayer nodes in level_two.tscn with SoundManager calls
    status: completed
  - id: verify-fmod
    content: Verify both levels compile and run cleanly
    status: in_progress
---
Existing project already has FMOD addon, SoundManager autoload, and FmodEvents class. The job is to swap all AudioStreamPlayer playback in player.gd, player.tscn, level_one.tscn, and level_two.tscn over to SoundManager calls. Music uses play_music, one-shots use play_sfx_attached or convenience wrappers. We keep the AudioStreamPlayer nodes as fallbacks for now but stop playing them; actual audio routes through FMOD. After edits, verify with runAndVerify on level_one and level_two.
