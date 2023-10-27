\version "2.16.2"

\header {
  title = "Chasing Patterns"
  subtitle = "A Song of Twilight"
  composer = "Raymond Arnold"
}

voicOne = \relative {
  \key e \major
  \numericTimeSignature
  \time 4/4
  \repeat unfold 4 {
    gis16 gis8. a16 a8. b8 e8 e4 ~ e1
    \tuplet 3/2 { b8 b b ~} b8  gis a gis  e4 ~ \noBreak e1 \break
  }
  a16 b b8  b8 b16 a8 gis8 r16 r4
  b8 b16 b8. a16 b4 ~b8. r8

  e,8 e16 fis8 e r16
  e8 e16 fis8 e r16
  e8 e16 fis8 e r16
  e8 e16 fis8 e r16

  b' b8 r16 b8 b16 a8 gis8 r16 r8.
  b16 b8 b16 b8. a16 b16 ~ b4 b16. e16. r16

  e,8 e16 fis8 e r16
  e8 e16 fis8 e r16
  e8 e16 fis8 e r16
  e8 e16 fis8 e r16

  gis4(  fis  e  dis)
  r1
  a'1

}

voicTwo = \relative {
  \key e \major
  \numericTimeSignature
  \time 4/4
  
  r1
  \repeat unfold 4 {
    gis'16 gis8. a16 a8. b8 e8 e4 ~ e1
    \tuplet 3/2 { b8 b b ~} b8  gis a gis e4 ~e1
  }
  r1 

  e'8 e16 fis8 e r16
  e8 e16 fis8 e r16
  e8 e16 fis8 e r16
  e8 e16 fis8 e r16

  r1 r1

  e8 e16 fis8 e r16
  e8 e16 fis8 e r16
  e8 e16 fis8 e r16
  e8 e16 fis8 e r16

  r1
  e8 e16 fis8. e16 e8 e16 fis8. gis8.
  a1
}

harmony = {
  \chordmode {
    \repeat unfold 26 {
      e1
    }
  }
}

verse_a = \lyricmode {
  Chas -- ing pat -- terns in the sky...  Trace the line from star to star
  Look a -- round and won -- der why...  Where we go -- ing, who we are
  Ver -- nal flow -- er, sum -- mer breeze...  Cric -- ket wing and au -- tumn leaves
  Frac -- tal pat -- terns, gol -- den mean... Whis -- pers of a world un -- seen.
}

verse_b_tenor = \lyricmode {
  We're look -- ing for a sig -- nal... hid -- den in the noise
  Where we come from, where we go -- ing? Where we come from, where we go -- ing?
  Look -- ing for an ans -- wer... to give the girls and boys, ask -- ing
  Where we come from, where we go -- ing? Where we come from, where we go -- ing?
  Oh... 
  Oh...
}

verse_b_alto = \lyricmode {
  Where we come from, where we go ing? Where we come from, where we go ing?
  Where we come from, where we go ing? Where we come from, where we go ing?
  Where we come from, where we go ing? 
  Oh... 
}

\score {
  <<
   \new ChordNames \with {
      \consists "Instrument_name_engraver"
      instrumentName = #"Guitar"
      shortInstrumentName = #"G"
   } {
     \harmony
   }
   \new Voice = "voice1" \with {
     \remove Forbid_line_break_engraver
   }{
      \set Staff.instrumentName = #"Tenor"
      \set Staff.shortInstrumentName = #"T"
      \clef "bass"
      \tempo 4=150
      \voicOne
    }
    \new Lyrics \lyricsto "voice1" {
      <<
        \new Lyrics {\verse_a \verse_b_tenor}
      >>
    }
    \new Voice = "voice2" \with {
      \remove Forbid_line_break_engraver
    }{
      \set Staff.instrumentName = #"Soprano"
      \set Staff.shortInstrumentName = #"S"
      \clef "treble"
      \tempo 4=150
      \voicTwo
    }
    \new Lyrics \lyricsto "voice2" {
      <<
        \new Lyrics {\verse_a \verse_b_alto}
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
    \new Voice = "1" {
      \tempo 4=90
      \set Staff.midiInstrument=#"Acoustic Guitar (nylon)"
      \set Staff.midiMaximumVolume=#.5
      \set Staff.midiMinimumVolume=#.5
      \harmony
    }

    \new Voice = "1" {
      \set Staff.midiInstrument=#"voice oohs"
      \set Staff.midiMaximumVolume=#1
      \set Staff.midiMinimumVolume=#1
      \voicOne
    }

    \new Voice = "2" {
      \set Staff.midiInstrument=#"voice oohs"
      \set Staff.midiMaximumVolume=#1
      \set Staff.midiMinimumVolume=#1
      \voicTwo
    }

  >>
  \midi {}
}
