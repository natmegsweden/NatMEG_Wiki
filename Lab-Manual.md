# Table of content

* [Acquisition](#acquisition)
* [Audio mixer](#audio-mixer)
* [Bad channels](#bad-channels)
* [Eye-tracker](#eye-tracker)
* [Screen and projector](#screen-and-projector)
* [Tuning](#tuning)

---

Acquisition


---

# Audio mixer

See picture below for an overview of how to control the sound mixer. The mixer should as default always be on. If it is switched off, use the on/off switch on the backside of the mixer to switch it back on.

<img src="https://github.com/natmegsweden/NatMEG_Wiki/blob/main/wiki_images/audio_mixer_marked.jpg" alt="audio_mixer_marked" width="700"/>


A. Select input. Sound from Stimulus Computer (A) and/or Audiofile (B)

B. Select the MSR backpanal loudspeakers as output and adjust the volume.

C. Select the sound tubes as output.

D. Select the Control Room speakers (the small speakers next to the mixer) as output.

E. Talkback. Hold down either button to use the mixer to speak to the participant inside the MSR.
   - Left button: speak though sound tubes. 
   - Right button: speak though the backpanel speakers.

F. Microphone for talkback.

G. Volume adjustment


## Before measurement
1. Make sure speakers in the control room are turned on. 
> ! There are separate speakers for the stimuli audio and the talkback microphone. The left ones are for stimuli audio and the right ones are for talkback.
2. Make sure audio mixer is on and that you have the right configuration (MSR speakers or sound tubes)
> ! If using the sound tubes be carful not to have too loud talkback volume
3. Check volume with participant

## During measurement
Remember to press the correct talkback button when communicating the the participant (MSR speakers or sound tubes)

## After measurement
1. Turn off speakers. Do *not* turn off audio mixer.
2. If using sound tubes make sure to through away eartips and wipe tubes with alcohol

## Issues
### There is no sound to the MSR

<u>Problem</u>: sound from the Stimulation Computer, Audiofile, or talkback does not appear inside the MSR

<u>Solution</u>: Do the following
- Check that the sound on the Stimulation Computer is on and at full volume.
- Make sure that the correct input is selected (A in the figure above).
- Make sure that the correct output is selected (B or C in the figure above).
- For sound tubes: check that the sound tube amplifier is switched on. The sound tube amplifier is located in the Stimulus Cabinet. Switch it on if it is switched off. WARNING: do not switch it on a participant has the sound tubes in their ears. 
- For backpanel speakers: check that the backpanel speaker amplifiers are switched on. The amplifiers are located on the top shelf of the MSR Cabinet. Switch on the amplifiers (the two small boxed; they should be blinking rapidly) and the input/output board if any are switched off.

### There is no sound from the MSR/I cannot hear the participant

<u>Problem</u>: there is no sound from the MSR, and I cannot hear if the participant is saying anything
> ! Your participant should, at all times, be able to speak to you. As the first thing, after you have positioned the participant in the scanner and left the MSR, you must test that the participant can hear you and you can hear them.

<u>Solution</u>: Do the following
- Make sure that the MSR monitor (the big loudspeaker on top of the Stimulation Cabinet) is switched on. The on/off switch is on the backside of the MSR monitor. The light in the logo on the front of the monitor will be on when the monitor is turned on.
- Make sure that you are using the correct talkback option; i.e. using the sound tube talkback when using the sound tubes.
- Make sure that the sound mixer is turned on. The sound also go through the video mixer; make sure that the video mixer is also turned on. Buttons on the video mixer have a red light when they are turned on. There is a small on/off switch on the back of the video mixer to turn it back on if it has been turned off.

---

# Eye-tracker

## Equipment required
- The screen
- Eye-tracker

## Before measurement
1. Put screen in correct position (see [Screen and projector](#screen-and-projector))
2. Start eye-tracker software by pressing the letter  *t*  on the keyboard, then press enter
> ! If you do not see a terminal on the eye-tracking PC when you turn on the screen
> - Check that the screen setting of the Stimulation PC is not set in dual screen mode and that the correct input channel is selected
> - Check that the eye-tracking computer is turned on. The computer is found at the bottom of the stimulation cabinet

> ! To start eye-tracker in simulation mode type *t -x* and press enter

3. Make sure you have the right configuration for your needs
4. Adjust eye-tracker by moving the arm or by tilting the screen a bit. 

## During measurement
1. Monitor eye-positions
> ! As participants tend to sink down a bit during recordings eye-tracking may be lost if not chair is raised properly
> ! If using the table, make sure pads or participant's hands are not blocking the eye-tracker

2. Check calibration

## After measurement
1. Turn off eye-tracking software
2. Remove eye-tracker and put back in box


## Issues

### The eye-tracking program is beeping and blinking
The eye-tracker has been disconnected from the cables in the MSR. Reconnect the eye-tracker or close the eye-tracking program.

---

# Screen and projector

## Equipment required
- The screen

## Before measurement
1. Drag the mirror into the right position
2. Place monitor in front of the mirror at the markings on the floor
3. Turn on projector by pressing on time at the remote control
> ! If participant is seated in the chair, be careful not to blind the participant with the light from the projector

## During measurement
Just remember that the participant can see what you see on the screen.

## After measurement
1. Move the screen away from the chair
2. Turn off the projector by pressing twice on the remote

---

# Tuning
Tuning is not always needed, but recommend at least for the first measure of the day.

## Before measurement
1. Open Acquisition
2. Click the menu Tools -> Tuner. The tuning tool will appear.
3. Click file -> load tuning. A message will pop up asking if you want to read the default state tuning. Click ok.
> ! Optionally, you can click "measure noise" before loading the tuning and again after loading the tuning to see the noise level.
> The average noise level should be around 2.6-2.7.

## During measurement
No action required

## After measurement
No action required

## Issues

### The average noise level is too high (> 3) after loading the default tuning

<u>Solution</u>: Do the following:
    1. Check that there are no objects in the MSR that could be causing disturbances, e.g. non-tested metallic stimulus equipment, left items, etc. Remove those items
    2. Run new tuning: click "measure noise" and when it has measured the noise level, click "Tune". The tuning procedure with iterate through tuning parameters and try to minimize the noise in the system. Each iteration takes about 20 seconds. Click "stop tuning" when the average noise level is below 2.7.

> ! The tuning procedure takes up to 15 min. Make sure that you have enough time to run the tuning procedure and always check the tuning well in advance before your participant arrives.
> ! If channels are missing, you might have to restart Acquisition (see this [Acquisition section](#acquisition)) before continuing with the tuning or call for assistance.

