\version "2.16.2"

\header {
  title = "Chasing Patterns"
  subtitle = #(if (not (ly:get-option 'compact)) "A Song of Twilight" "")
  composer = #(if (not (ly:get-option 'compact)) "Raymond Arnold" "")
}

voicOne = \relative {
  \key a \major
  \numericTimeSignature
  \time 4/4
  r2. r8.
  \repeat volta 4 {
    gis16 gis8. a16 a8. b8 e8. e1 r8.
    \tuplet 3/2 { b8 b b ~} b8  gis a gis e16 ~ e4 r2. r8. \break
  }
  a16 b b8 r16 b8 b16 a8 gis8 r16 r4
  b8 b16 b8. a16 b4 ~b8. r8 \break

  a8 a16 d8 e r16
  a,8 a16 d8 e r16 \break
  a,8 a16 d8 e r16
  a,8 a16 d8 e r16 \break

  b b8 r16 b8 b16 a8 gis8 r16 r8.
  b16 b8 b16 b8. a16 b16 ~ b4 b16. e16. r16 \break

  a,8 a16 d8 e r16
  a,8 a16 d8 e r16 \break
  a,8 a16 d8 e r16
  a,8 a16 d8 e r16 \break

  g1
  d8 d16 e8. d16 d8 d16 e8. g8.
  a1 ~ a2.
}

voicTwo = \relative {
  \key a \major
  \numericTimeSignature
  \time 4/4
  r1 r2. r8.
  \repeat volta 4 {
    gis'16 gis8. a16 a8. b8 e8. e1 r8. \break \tuplet 3/2 { b8 b b ~} b8  gis a gis e16 ~ e4 r2. r8.
  }
  r1 \break

  a8 a16 d8 e r16
  a,8 a16 d8 e r16 \break
  a,8 a16 d8 e r16
  a,8 a16 d8 e r16 \break

  b b8 r16 b8 b16 a8 gis8 r16 r8.
  b16 b8 b16 b8. a16 b16 ~ b4 b16. e16. r16 \break

  a,8 a16 d8 e r16
  a,8 a16 d8 e r16 \break
  a,8 a16 d8 e r16
  a,8 a16 d8 e r16 \break

  g1
  d8 d16 e8. d16 d8 d16 e8. g8.
  a1 ~ a2.
}

verse_a = \lyricmode {
  Chas ing pat terns in the sky...  Trace the line from star to star
  Look a round and won der why...  Where we go ing, who we are
  Ver nal flow er, sum mer breeze...  Cric ket wing and au tumn leaves
  Frac tal pat terns, gol den mean... Whis pers of a world un seen.

  We're look ing for a sig nal... hid den in the noise
  Where we come from, where we go ing? Where we come from, where we go ing?
  Look ing for an ans wer... to give the girls and boys, ask ing
  Where we come from, where we go ing? Where we come from, where we go ing?
  Oh... Where we come from, where we go ing?
  Oh...
}


\score {
  <<
    \new Voice = "voice1" {
      \set Staff.instrumentName = #"Voice One"
      \set Staff.shortInstrumentName = #"V"
      \clef "treble"
      \tempo 4=150
      \key a \major
      \unfoldRepeats
      \voicOne
    }
    \new Lyrics \lyricsto "voice1" {
      <<
        \new Lyrics \verse_a
      >>
    }
  >>
  \layout {
    \context {
      \Score
    }
  }
}

\score {
  <<
    \unfoldRepeats
    \new Voice = "1" {
      \voiceOne
      \tempo 4=90
      \set Staff.midiInstrument=#"voice oohs"
      \set Staff.midiMaximumVolume=#1
      \set Staff.midiMinimumVolume=#1
      \voicOne
    }
    \unfoldRepeats
    \new Voice = "2" {
      \voiceTwo
      \tempo 4=90
      \set Staff.midiInstrument=#"voice oohs"
      \set Staff.midiMaximumVolume=#1
      \set Staff.midiMinimumVolume=#1
      \voicTwo
    }

  >>
  \midi {}
}
