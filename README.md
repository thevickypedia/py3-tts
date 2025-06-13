<p align="center">
  <img src="https://raw.githubusercontent.com/thevickypedia/py3-tts/master/.github/logo.png?sanitize=true" width="200px" height="200px">
</p>
<h2 align="center">Offline Text To Speech (TTS) converter for Python </h2>


[![](https://pepy.tech/badge/py3-tts)](https://pepy.tech/badge/py3-tts)
[![](https://pepy.tech/badge/py3-tts/month)](https://pepy.tech/badge/py3-tts/month)

[![](https://img.shields.io/github/languages/code-size/thevickypedia/py3-tts.svg?style=plastic)](https://github.com/thevickypedia/py3-tts)
[![](https://img.shields.io/github/license/thevickypedia/py3-tts?style=plastic)](https://github.com/thevickypedia/py3-tts)

[![](https://img.shields.io/pypi/v/py3-tts.svg?style=plastic)](https://pypi.org/project/py3-tts/)
[![](https://img.shields.io/github/languages/top/thevickypedia/py3-tts.svg?style=plastic)](https://github.com/thevickypedia/py3-tts)

[![](https://github.com/thevickypedia/py3-tts/actions/workflows/pythonpublish.yml/badge.svg)](https://github.com/thevickypedia/py3-tts/actions/workflows/pythonpublish.yml)
[![](https://github.com/thevickypedia/py3-tts/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/thevickypedia/py3-tts/actions/workflows/pages/pages-build-deployment)

[![](https://img.shields.io/badge/re_implementer-thevickypedia-blue.svg)](https://github.com/thevickypedia)
[![](https://img.shields.io/badge/author-nateshmbhat-orange.svg)](https://github.com/nateshmbhat)

`py3-tts` (originally [`pyttsx3`](https://github.com/nateshmbhat/pyttsx3)) is a text-to-speech conversion library in Python. Unlike alternative libraries, **it works offline**.

## Installation

```shell
pip install py3-tts
```

> If you get installation errors, make sure you first upgrade your wheel version using

```shell
pip install --upgrade wheel
```

### Linux installation requirements

+ If you are on a linux system and if the voice output is not working,

  Install `espeak`, `ffmpeg` and `libespeak1` as shown below

  ```shell
  sudo apt update && sudo apt install espeak ffmpeg libespeak1
  ```

## Features

- ✨Fully **OFFLINE** text to speech conversion
- 🎈 Choose among different voices installed in your system
- 🎛 Control speed/rate of speech
- 🎚 Tweak Volume
- 📀 Save the speech audio as a file
- ❤️ Simple, powerful, & intuitive API

## Usage

```python
import pyttsx3

engine = pyttsx3.init()
engine.say("I will speak this text")
engine.runAndWait()
```

**Single line usage with speak function with default options**

```python
import pyttsx3

pyttsx3.speak("I will speak this text")
```

**Changing Voice, Rate and Volume**

```python
import pyttsx3
engine = pyttsx3.init() # object creation

# RATE
rate = engine.getProperty('rate')   # getting details of current speaking rate
print (rate)                        # printing current voice rate
engine.setProperty('rate', 125)     # setting up new voice rate

# VOLUME
volume = engine.getProperty('volume')   # getting to know current volume level (min=0 and max=1)
print (volume)                          # printing current volume level
engine.setProperty('volume',1.0)        # setting up volume level  between 0 and 1

# VOICE
voices = engine.getProperty('voices')       # getting details of current voice
#engine.setProperty('voice', voices[0].id)  # changing index, changes voices. o for male
engine.setProperty('voice', voices[1].id)   # changing index, changes voices. 1 for female

engine.say("Hello World!")
engine.say('My current speaking rate is ' + str(rate))
engine.runAndWait()
engine.stop()

# Saving Voice to a file
# On Linux, make sure that 'espeak-ng' is installed
engine.save_to_file('Hello World', 'test.mp3')
engine.runAndWait()

```

#### Included Text-To-Speech Engines by Operating System
|                         | Linux | macOS | Windows |
|-------------------------|:-----:|:-----:|:-------:|
| [AVSpeech][]            |       |   ✅︎  |         |
| [eSpeak][]              |   ✅︎  |   ✅︎  |    ✅︎   |
| [NSSpeechSynthesizer][] |       |   ✅︎  |         |
| [SAPI5][]               |       |       |    ✅︎   |

> [!NOTE]
> * AVSpeechSynthesizer support is still experimental.
> * NSSpeechSynthesizer is deprecated by Apple.

[AVSpeech]: https://developer.apple.com/documentation/avfoundation/speech_synthesis
[eSpeak]: https://github.com/espeak-ng/espeak-ng?tab=readme-ov-file#readme
[NSSpeechSynthesizer]: https://developer.apple.com/documentation/appkit/nsspeechsynthesizer
[SAPI5]: https://learn.microsoft.com/en-us/previous-versions/windows/desktop/ms723627(v=vs.85)

Feel free to wrap another text-to-speech engine for use with ``pyttsx3``.

### Project Links

* PyPI (https://pypi.org/project/py3-tts/)
* GitHub (https://github.com/thevickypedia/py3-tts)
* Full Documentation (https://py3-tts.vigneshrao.com/)

### Credits

**[nateshmbhat](https://github.com/nateshmbhat)** for the original code [pyttsx3](https://pypi.org/project/pyttsx3/)
