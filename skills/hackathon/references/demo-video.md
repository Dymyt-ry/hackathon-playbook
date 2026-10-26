# Demo video (phase 12) — recorded in Recordly

[Recordly](https://github.com/webadderallorg/Recordly) (free, macOS / Windows / Linux) records the screen and adds auto-zooms,
cursor polish, a styled background frame, an optional webcam bubble, trims,
speed regions and text annotations. Do every step:

## 12a. Storyboard first — write `DEMO_VIDEO.md` before anything is recorded

Target **60–90 seconds**. Every second must show the product doing something.
Use this structure and fill in the real screens/clicks from `DEMO.md`:

| Time | Beat | On screen | Voiceover / caption (one line) |
|---|---|---|---|
| 0:00–0:05 | Hook | the single most impressive result screen | the problem in one sentence, with the real number/quote from phase 1 |
| 0:05–0:15 | Who + pain | the "before" state or the user's starting point | who has the problem and what it costs them |
| 0:15–0:60 | The flow | the critical user flow from `MVP.md`, step by step, one click per beat | what the user gets at each step (benefit, not feature name) |
| 0:60–0:75 | The wow | the result / the moment the product delivers | the outcome in numbers if possible |
| 0:75–0:90 | Close | logo + product name + one-line value prop (+ URL / QR) | call to action or the "why now" |

Rules for the storyboard:
- One idea per beat; no beat without a visible change on screen.
- Show the result in the first 5 seconds — judges decide early.
- Never show: login screens, loading spinners, empty states, settings, code,
  terminal, errors. Pre-log-in and pre-load everything.
- Captions in the video must make sense with the sound off.

## 12b. Prepare the screen (checklist — tick each)

- Seeded, realistic data (no lorem, no zeros, no "test123").
- Clean browser profile or window: no bookmarks bar, no extensions, no other tabs; 1920×1080 window; zoom 110–125 % so text reads in the video.
- Do Not Disturb on; desktop icons hidden; notifications off.
- Dark/light mode matches `DESIGN.md`.
- Mobile app: record the real device or simulator mirror at device size; enable the device frame in Recordly if available.
- Run the full click path from `DEMO.md` once without recording.

## 12c. Record and edit in Recordly

1. Record the whole flow in one take following `DEMO_VIDEO.md`; move the cursor slowly and deliberately, pause ~1 s after each click.
2. Turn on **auto zoom suggestions**, then keep only zooms that land on the thing the voiceover talks about; add manual zoom regions where a detail matters.
3. Cursor: smoothing on, click bounce on, size slightly larger than default.
4. Styled frame: background colour/gradient from `DESIGN.md`, padding + shadow.
5. **Trim** dead time; add **speed-up regions** over any waiting.
6. Text annotations = the captions from the storyboard.
7. Webcam bubble only if the presenter talks to camera in the video.
8. Voiceover: record separately or live; read the storyboard lines.
9. Export **MP4 1080p** for submission; optional short GIF for the README/socials. Save the `.recordly` project so edits stay possible.
10. Watch the export once start to finish with sound off, then once with sound on; fix anything that does not match the storyboard.
