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
    gis16 gis8. a16 a8. b8 e8. e1 r8. \break \tuplet 3/2 { b8 b b ~} b8  gis a gis e16 ~ e4 r2. r8.
  }
}

voicTwo = \relative {
  \key a \major
  \numericTimeSignature
  \time 4/4
  r1 r2. r8.
  \repeat volta 4 {
    gis16 gis8. a16 a8. b8 e8. e1 r8. \break \tuplet 3/2 { b8 b b ~} b8  gis a gis e16 ~ e4 r2. r8.
  }
}

verse_a = \lyricmode {
  Chas ing pat terns in the sky...  Trace the line from star to star
  Look a round and won der why...  Where we go ing, who we are
  Ver nal flow er, sum mer breeze...  Cric ket wing and au tumn leaves
  Frac tal pat terns, gol den mean... Whis pers of a world un seen.
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
