\version "2.18.2"

\header {
  title = "Bring the Light"
  composer = "Alex Federici et al"
}

words = \lyricmode {
  Bring the light 
  Bring the li ight

  Oh bring the light and let it shine on me 

    Bring the light (Bring the light)
    Bring the li ight (Bring the li ight)

    Drive your cha -- ri -- ot (Bring the Light) 
    Pull the flame (Bring the Li ight) 

    Bat -- tle the moon (Bring the light) 
    Dark -- ness looms (Bring the li ight) 

    Speak the word (Bring the light) 
    Let it be (Bring the li ight) 

    Star -- dust ga -- ther (Bring the light) 
    Fu -- sing mat -- ter (Bring the li ight) 

  Oh bring the light and let it shine on me 

  Oh bring the light and let it shine on me 
}

melody = \relative c' {
  \time 3/4
  \clef alto
  a2 e4 a2. r r
  a2 a4 c a2 r2. \break

  \repeat volta 5 {
  r2 e4 a2 a4 c2 d4 e e r d2 c4 a2. r r \break
  }
  \alternative { {
    a2 e4 a2.   a2 e4 a2.
    a2 a4 c a2   a2 a4 c a2 \break
  } {
    a2 c4 e4. d8 c4    a2 e4 a2.
    e'2 c4 e2( c4)   a2 a4 c a2 \break
  } {
    c4 c a c2.    a2 e4 a2.
    e'2 c4 e2.   a,2 a4 c a2 \break
  } {
    e'2 a,4 e'2.    a,2 e4 a2.
    e'2 d4 c( b a)   a2 a4 c a2 \break
  } {
    e2 a4 c8 a r2    a2 e4 a2.
    e'2 c4 e8 a,8 r2    a2 a4 c a2 \break
  } }
  r2 e4 a2 a4 c2 d4 e e r d2 c4 a2. r r \break
  r2 e4 a2. a4 c2~c d4 e e2 d2. c2. a2. ~ a
}

harmony = {
  \chordmode {
    s2. a s s 
    a c s
    \repeat volta 5 {
      s d s s a s s s
    } \alternative {{
      d a s s 
      s c s s
    } {
      d a s s 
      s c s s
    } {
      d a s s 
      s c s s
    } {
      d a s s 
      s c s s
    } {
      d a s s 
      s c s s
    } }
    s d s s s a s s
    s d s s e s c a s
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
}
