\version "2.18.2"

\header {
  title = "Bring the Light, Reprise"
}

words = \lyricmode {
  Bring the light 
  Bring the li ight
  Oh bring the light and let it shine on me 

  Warm the Earth (Bring the light)
  Wake the se ed (Bring the li ight)
  Oh bring the light and let it shine on me

  Fuel my eyes (Bring the light)
  Ban -- ish li es (Bring the li ight)
  Oh bring the light and let it shine on me

  Bring the light and let it shine...
  Bring it back just one more time...
  Bring the  light and let it shine...
  Let it shine on  me   
  Let it shine on  me   
}

melody = \relative c' {
  \time 3/4
  \clef alto
  a2 e4 a2. r r
  a2 a4 c a2 r2. \break

  r2 e4 a2 a4 c2 d4 e e r d2 c4 a2. r r \break

  \repeat unfold 2 {
    a2 e4 a2.   a2 e4 a2.
    a2 a4 c a2   a2 a4 c a2 \break
  r2 e4 a2 a4 c2 d4 e e r d2 c4 a2. r r \break
  }
  e'2 d4 e2 d4 g g r f2. a2 g4 a2 g4 b2 a4 g( f e)
  a,2 a4 c r  c d2 d4 e2. r r
  e4 e4 r d2 c4 a2.
}

harmony = {
  \chordmode {
    s2. a s s 
    a c s
    \repeat unfold 2 {
      d a s s s c s s
      s d s s a s s s
    }
    d a s s s c s a
    d s s s e s s s d s s s d s s s a 
  }
}

\score {
  
  <<
    \new ChordNames {
      \set midiMaximumVolume = #0.5
      \set midiInstrument = #"acoustic guitar (nylon)"
      \harmony
    }
    \new Voice = "one" {
      \tempo 4 = 160
      \set Staff.midiInstrument=#"voice oohs"
      \melody
    }
    \new Lyrics = "va" \lyricsto "one" {
      \words
    }
  >>
  \layout {}
  \midi {}
}
